Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE1142C1B9
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 15:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhJMNwa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 09:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbhJMNw3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 09:52:29 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F87FC061570;
        Wed, 13 Oct 2021 06:50:26 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so3737638otr.7;
        Wed, 13 Oct 2021 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=y7iB3v9eyVIGIeRp7ePzsvTEJVlMo/4y8tCdosnTUdw=;
        b=VrcQ5nkNVVXGGAq9CWjsh5jCRnqzzMym9FoXb6kTuxmR7Cl0CeXOqr7KUxfe2b5y/V
         mUy0sUwivVbetQ6VOLyvsJ7zf/Lsy5lAGAkrW76Tyf/jwML3TLm7LHsLQM8XozwQ1sE5
         OnVmvCP2f83u8GR1qV4DzzEnLKjRFo0xJ0kEAaIS73Z+VhuGHDGhxx7eDy4UjPepwBOh
         auPkiuLAoxQzR5RGMNYpXkqUn7Odgjc8S1rdseD36tUIE/XV64jMsGlkqsyO7CgoXZeE
         FH0Um3n8zQrqhiLUa0vHp4G1fmKjxs9t7sGZEFikCWpx0ppF1//RdsGDnWrQP/RDjq1n
         wNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=y7iB3v9eyVIGIeRp7ePzsvTEJVlMo/4y8tCdosnTUdw=;
        b=38fF/qQOkql4cRP+YookkW1k4GQA/JUO2QC/cY4V/gLENGNB9/Uif9kQ14+iUnIA1d
         jKYLPPCaaqOfED496vDRnIpeZZ/5EPfZaETsyjlGjEofGOOvmOnpkUar/bicZg5VP0Ri
         VNAzF8yFpp86yEd6l03ZP0x0iDt96U6qS8xM1DwKUxE8giG33bCVU+BghXt21x5wtIJe
         v9eSbEk9nLAMPV1TRewFgjkhuX2483HEs4ORxoYitLqGr9tF3uedjld0+SAxPp3WyjnS
         xGV/cHSOxHZZ8CtWOKZM8/FQlq/4dDNYnKaOT4sdS6B4HeuwYWwq3ntyWFxY6BJqejw5
         dV5Q==
X-Gm-Message-State: AOAM5319FPuB6CuFFE7Of/SFCQvO1/d7371D3RpRHIOyqlHKvba/Vvii
        /xtfC2JUsAAfUS6PzfB5Sg==
X-Google-Smtp-Source: ABdhPJyKTKFslM5h1cdy0HZjP25EyghEp6IhOS044H63ASpSsRwuWVxZXW0GGVsTDJFbaoEg957WLw==
X-Received: by 2002:a9d:109:: with SMTP id 9mr27607945otu.20.1634133025844;
        Wed, 13 Oct 2021 06:50:25 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id f1sm1317283oos.46.2021.10.13.06.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 06:50:25 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5420:eef4:496e:3efb])
        by serve.minyard.net (Postfix) with ESMTPSA id 7B1081800F7;
        Wed, 13 Oct 2021 13:50:24 +0000 (UTC)
Date:   Wed, 13 Oct 2021 08:50:23 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 13
Message-ID: <20211013135023.GI66936@minyard.net>
Reply-To: minyard@acm.org
References: <20211013170522.4c6e21a1@canb.auug.org.au>
 <YWbNVXemcnxO8wsG@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWbNVXemcnxO8wsG@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 13, 2021 at 07:13:09AM -0500, Rob Herring wrote:
> On Wed, Oct 13, 2021 at 05:05:22PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release tomorrow.
> > 
> > Changes since 20211012:
> > 
> > The arm-soc tree lost its build failure.
> > 
> > The net-next tree gained a conflict against the net tree.
> > 
> > The drm-misc tree lost its build failure.
> > 
> > The amdgpu tree lost its build failure.
> > 
> > Non-merge commits (relative to Linus' tree): 7055
> >  6867 files changed, 394074 insertions(+), 162696 deletions(-)
> 
> The commit 9cc6726f68af ("ipmi:ipmb: Add OF support") was added and has 
> warnings for 'make dt_binding_check'. I'm replying here because the 
> commit hasn't been sent to any list in lore.

Thanks, I have fixed all these issues, I think.  Running

  make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/ipmi/ipmi-ipmb.yaml

doesn't show any errors or warnings for this file, though it shows some
for other files.

-corey

> 
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dts:22.13-26: Warning (reg_format): /example-0/ipmi-ipmb@0x40:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dts:19.24-26.11: Warning (unit_address_format): /example-0/ipmi-ipmb@0x40: unit name should not have leading "0x"
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: example-0: ipmi-ipmb@0x40:reg:0: [64] is too short
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/ipmi/ipmi-ipmb.example.dt.yaml: example-0: 'ipmi-ipmb@0x40' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/dt-core.yaml
> 
> 
> Rob
