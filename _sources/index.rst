BDX-R Project Documentation
===========================

+-------------------------------------------------+------------------------------------------------+
| .. figure:: source/_static/bdx_r_front.png      | .. figure:: source/_static/bdx_r_side.png      |
|    :width: 100%                                 |    :width: 100%                                |
|    :alt: Front view of BDX-R                    |    :alt: Side view of BDX-R                    |
+-------------------------------------------------+------------------------------------------------+

BDX-R is an open, community-driven biped platform focused on practical robot learning and reproducible 
sim-to-real transfer. We provide robot descriptions, simulation assets, training tasks, and CAD models. 
This documentation brings together all the different projects and efforts involved in creating the 
BDX-R robot, including its construction, training, and sim-to-real deployment.

License
^^^^^^^

Please refer to each repository for its specific licensing information.

Acknowledgment
^^^^^^^^^^^^^^

Special thanks to Disney for the inspiration, the Isaac Lab and MjLab development teams for their 
reinforcement learning frameworks, and of course the developers of this project and everyone who 
contributed to it.

Table of Contents
^^^^^^^^^^^^^^^^^

.. toctree::
   :maxdepth: 1
   :caption: Building the Robot

   source/building

.. toctree::
   :maxdepth: 1
   :caption: Reinforcement Learning
   :titlesonly:

   source/rl/isaaclab
   source/rl/mjlab

.. toctree::
   :maxdepth: 1
   :caption: Imitation Learning
   :titlesonly:

   source/il/collecting

.. toctree::
   :maxdepth: 2
   :caption: Deploying on the Real Robot
   :titlesonly:

   source/deployment

