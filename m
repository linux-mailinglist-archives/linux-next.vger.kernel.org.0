Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9634242BF90
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 14:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhJMMPO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 08:15:14 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39449 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMMPO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 08:15:14 -0400
Received: by mail-ot1-f54.google.com with SMTP id k2-20020a056830168200b0054e523d242aso3379522otr.6;
        Wed, 13 Oct 2021 05:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tfe2N7rj5j3n+ftOPGZJE3vZ01hZsrDbPoprLIjlnLs=;
        b=d9Jun4rmsIXccI3udHg5SMG4eEGfgdSI9+YL9g6k/odKfb01pJ+x6DOtZrFPCvGC2H
         /ul+kZPqRlOZbu4PvWmwxu4x7Ztlivt/SrjPhwhCzI9BOijB+JTRXeE5jmnVamalsoBK
         BqvbzzDvicTkv30AsnSsxUnnxA1P0NCvNFHtdhs/Ef2XsvVhFOJEr9WqJvASJqYlzKkD
         s08/EBzk5FehUl7mI8hFLCbgFYOnnwZ6FRNnuGhwgW/oJxVUXiO7LUzcokqsG2aSmG0c
         9v5wc8CaTW5zVBKag/W9a2mxak4zBWW1SHlEKgGkUDvubfaddh2/12IJ/NvdhBVMi6wl
         h6LQ==
X-Gm-Message-State: AOAM532RHcEHpVvP3QDdjLWov5TrKe12BQbsBbbY48X2qTHcfUPrvtxQ
        pRO/VfeQFB+O0HklX9jttQ==
X-Google-Smtp-Source: ABdhPJzFOBhZFAsfOWqs1w4jktLjtdmNcDllxLmZYKERPT8tfehw3S1S9Td/QzIYNylxaIz1UngLzQ==
X-Received: by 2002:a05:6830:349:: with SMTP id h9mr15633550ote.349.1634127190546;
        Wed, 13 Oct 2021 05:13:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bb39sm2956661oib.28.2021.10.13.05.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 05:13:10 -0700 (PDT)
Received: (nullmailer pid 783942 invoked by uid 1000);
        Wed, 13 Oct 2021 12:13:09 -0000
Date:   Wed, 13 Oct 2021 07:13:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Corey Minyard <minyard@acm.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 13
Message-ID: <YWbNVXemcnxO8wsG@robh.at.kernel.org>
References: <20211013170522.4c6e21a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013170522.4c6e21a1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 13, 2021 at 05:05:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release tomorrow.
> 
> Changes since 20211012:
> 
> The arm-soc tree lost its build failure.
> 
> The net-next tree gained a conflict against the net tree.
> 
> The drm-misc tree lost its build failure.
> 
> The amdgpu tree lost its build failure.
> 
> Non-merge commits (relative to Linus' tree): 7055
>  6867 files changed, 394074 insertions(+), 162696 deletions(-)

The commit 9cc6726f68af ("ipmi:ipmb: Add OF support") was added and has 
warnings for 'make dt_binding_check'. I'm replying here because the 
commit hasn't been sent to any list in lore.

Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dts:22.13-26: Warning (reg_format): /example-0/ipmi-ipmb@0x40:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dts:19.24-26.11: Warning (unit_address_format): /example-0/ipmi-ipmb@0x40: unit name should not have leading "0x"
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt/Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: example-0: ipmi-ipmb@0x40:reg:0: [64] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: example-0: 'ipmi-ipmb@0x40' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/dt-core.yaml


Rob
