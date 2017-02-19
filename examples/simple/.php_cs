<?php

$header = <<<EOF
This file is part of Manala - Lint Php

Copyright © Manala

@author Manala <contact@manala.io>
EOF;

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__ . '/src')
    ->exclude('bar')
;

return PhpCsFixer\Config::create()
    ->setUsingCache(true)
    ->setFinder($finder)
    ->setRules([
        '@Symfony' => true,
        'concat_space' => ['spacing' => 'one'],
        'phpdoc_summary' => false,
        'phpdoc_annotation_without_dot' => false,
        'phpdoc_order' => true,
        'array_syntax' => ['syntax' => 'short'],
        'ordered_imports' => true,
        'simplified_null_return' => false,
        'header_comment' => ['header' => $header],
    ])
;
