#!/usr/bin/python3

import pytest
import networkx as nx

import gorynych

import gorynych.ontologies.gch.nodes.basic.agent as agent
import gorynych.ontologies.gch.nodes.basic.person as person
import gorynych.core.edge as edge
import gorynych.core.ontology as ontology

import gorynych.ontologies.gch.gch


def test_ontology():
    a = agent.Agent(1)
    print(a)
    b = person.Person({"nationality": "RU"})
    print(dir(b))
    print(b.attributes)

    A = agent.Agent
    P = person.Person
    E = edge.Edge
    ont = ontology.Ontology(
        [P],
        [E],
        []
    )
    G = nx.MultiDiGraph()
    G.add_node(a)
    G.add_node(b)
    try:
        ont.check_graph_fit(G)
    except ValueError as e:
        print(e)

    G = gorynych.ontologies.gch.gch.GORYNYCH_ONTOLOGY

    print(G)
    print(G.node_types)

    email = G.node_types['Email']()
    print(email)