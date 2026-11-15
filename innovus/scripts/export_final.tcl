# Run after the required final checks; outputs are written in the working directory.
update_names -nocase
saveNetlist top_post_layout.v -topModuleFirst -flat
streamOut top.gds -mapFile /users/iit/cadence/tsmc65/PRTF_EDI_N65_gdsout_6X1Z1U.24a.map
