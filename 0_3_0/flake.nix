{
  description = ''Memoize Nim functions'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-memo-0_3_0.flake = false;
  inputs.src-memo-0_3_0.owner = "andreaferretti";
  inputs.src-memo-0_3_0.ref   = "0_3_0";
  inputs.src-memo-0_3_0.repo  = "memo";
  inputs.src-memo-0_3_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-memo-0_3_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-memo-0_3_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}