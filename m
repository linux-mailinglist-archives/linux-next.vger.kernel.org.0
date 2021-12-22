Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E5947D5F1
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 18:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhLVRoB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Dec 2021 12:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbhLVRoB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2021 12:44:01 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CC0C061574;
        Wed, 22 Dec 2021 09:44:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bt1so6937231lfb.13;
        Wed, 22 Dec 2021 09:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:from:subject
         :content-transfer-encoding;
        bh=hI44alCBMb6sS97Llt50LudbiqSbCyeG3dGh0ijfen0=;
        b=Fi8N9py/rC0Xo3UM2gSETcw5MQw6N68kl4EAZfQGH/FQt8I9jZb+ruX4yejltNZNIu
         L9UEhN501ZgKMtGXaKprl1V618hnjq8JVjejpQLtTvjPCaRBtVr64ZR4VfvStECGuPeP
         cGdz9SZWQ15eRgItKRmqVx/lFD19UlUrV9mxrloWGoZCinyP9Qy78uei39ROlTsXYpHh
         AKghDpZBDA7NzsDg7ro88VMLSoQ7goBLMLdrzlNM2OsA0XnGYeTwW6T4DZTfQi2U4bzH
         gTQtIJuros5yUBDBN/bOFkrP5Bg1KgFCKPbnyvZs3LanDq2IF7gEK/MGirWBlg/J7nCn
         EhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :from:subject:content-transfer-encoding;
        bh=hI44alCBMb6sS97Llt50LudbiqSbCyeG3dGh0ijfen0=;
        b=fqsZLBHzpjPffb3jS+Lz3KNzkPTp1/rkE8gdQk9+brByLJpGp4rS5wtzZs1n42PCW8
         kfjBs5jy7rHtxGM/YT7Q9hHNShwnLiX5kZcANO+1QABh8Dumom6JXm/NyFk75G7Us7Fc
         v4w3xg34NyD95DYkpvrL71ALU/12DGgw9IYL6DlaLezCkCwVMvJML6G9MRjXBTTyF+uY
         NgCcw247g+4Ql16OT6DIzqjO8/kT2fQGMIsjjepZQgKIVuAVRKkWGRrRS8WbJzCjfE8S
         uLc4le2EkzekmQ7SBKlFhDnk9VdLsur6EBiVpPKN5GlhqYhq3Oh3IraDqw5eovR+js0x
         BMaQ==
X-Gm-Message-State: AOAM530qpCbtha12u3J/3lEezKF23SqiXEpKstuMS23ogSzoIfdOPCFr
        SnOduca26mBAPmC2DncW3VNhejpKm1I=
X-Google-Smtp-Source: ABdhPJyW9dM5lw3f7wmG+eynErvsrPNTPxLwa6U/fMu42qB6SmF1ruMSOp0ZA0ffOjUVhQSTAfn5fA==
X-Received: by 2002:ac2:4e11:: with SMTP id e17mr3143634lfr.126.1640195039174;
        Wed, 22 Dec 2021 09:43:59 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id d5sm273568lfv.83.2021.12.22.09.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 09:43:58 -0800 (PST)
Message-ID: <35c7df78-6e8a-b996-3df8-2c405bfcff81@gmail.com>
Date:   Wed, 22 Dec 2021 18:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To:     Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>
Cc:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: make dt_binding_check broken by drm & lvds-codec
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

I just noticed that "make dt_binding_check" doesn't work in linux-next:

   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
Traceback (most recent call last):
   File "/home/rmilecki/.local/bin/dt-mk-schema", line 38, in <module>
     schemas = dtschema.process_schemas(args.schemas, core_schema=(not args.useronly))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 587, in process_schemas
     sch = process_schema(os.path.abspath(filename))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 561, in process_schema
     schema = load_schema(filename)
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 126, in load_schema
     return do_load(os.path.join(schema_basedir, schema))
   File "/home/rmilecki/.local/lib/python3.6/site-packages/dtschema/lib.py", line 112, in do_load
     return yaml.load(tmp)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/main.py", line 343, in load
     return constructor.get_single_data()
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
     return self.construct_document(node)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 123, in construct_document
     for _dummy in generator:
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
     value = self.construct_mapping(node)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
     return BaseConstructor.construct_mapping(self, node, deep=deep)
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
     if self.check_mapping_key(node, key_node, mapping, key, value):
   File "/usr/lib/python3.6/site-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
     raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
   in "<unicode string>", line 4, column 1
found duplicate key "if" with value "{}" (original value: "{}")
   in "<unicode string>", line 113, column 1

It's caused by two commits:
ba3e86789eaf ("dt-bindings: display: bridge: lvds-codec: Document LVDS data mapping select")
d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")

Both commits add "if" and "then" at YAML "root" level.

Can you take a look at that, please?
