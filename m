Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F4047D60F
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 18:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344428AbhLVRvO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Dec 2021 12:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344431AbhLVRvO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2021 12:51:14 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CA6C061574;
        Wed, 22 Dec 2021 09:51:13 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A1BBA83049;
        Wed, 22 Dec 2021 18:51:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1640195471;
        bh=MXqtXI3GGUTQTT+1yIKhTL61gRETm2WH9p/pb1rrv7Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hzuBgR/R28Tajc9cuC0NPLq7QX7IEEJAZhBOuVyJLdJbcvS/q2s5tqvsuzCdE+GNa
         kDRae72E9OP5QhhmARtwYVN+2vEDOkuXJT+kYWZwPh6abdyiXlu3fYPbeucPnQOzIG
         FJpKvt3aOlMJoZ+Ngfe/BBSm9RbayCh0oQ3SlWDmppgDuXph6pDdGDRDal+XZWXSgZ
         Zn0TuHt7QgG2QCIJowpMR0VL/0w7+tsQSch3oPEpm7DrCUrNLBTntJLBYTGZG6yCWe
         Vz1tolJKdiA/vmVw97A05gVHrKp9YwH5tZ/CkQU1mnv1N3tu3HdyxU/zHqw48Vmtxj
         p49BlXlRnJttA==
Message-ID: <d35e3cfc-0e96-f234-a63d-0e976dfe8157@denx.de>
Date:   Wed, 22 Dec 2021 18:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: make dt_binding_check broken by drm & lvds-codec
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <treding@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <35c7df78-6e8a-b996-3df8-2c405bfcff81@gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <35c7df78-6e8a-b996-3df8-2c405bfcff81@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/22/21 18:43, Rafał Miłecki wrote:
> Hi,

Hi,

> ba3e86789eaf ("dt-bindings: display: bridge: lvds-codec: Document LVDS 
> data mapping select")
> d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel 
> data sampling edge select")
> 
> Both commits add "if" and "then" at YAML "root" level.
> 
> Can you take a look at that, please?

This should already be fixed by:
[PATCH] dt-bindings: display: bridge: lvds-codec: Fix duplicate key

+CC Thomas/Thierry, can you please pick the aforementioned patch ?
