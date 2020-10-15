Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A926C28F847
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 20:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732892AbgJOSRm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 14:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgJOSRm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 14:17:42 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AAEC061755;
        Thu, 15 Oct 2020 11:17:41 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v12so2031239ply.12;
        Thu, 15 Oct 2020 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wgIK7zbpXWjdXBtD36efr+BpdwUj1e5hEN/TLn+lrLU=;
        b=biUeRCDFw/kQDjd1VgIwlkyU00KgC0cYdaP4HvZ6rqPHGLPgov390yhK3n5VVoW1Uj
         cMY4IvfRerVbf8YTgwqOhIUS/FrkU8N4vJfYOoaYcCqJK0M3xmvZ7G/gLwYATr22Dwg2
         7cOFSUT9Z5J2te9ctuCc2MLmwQRDhkK4ebqz11NQBY6uwzI6/U1RiZY+L+O8Dr1HVIvn
         RB5IOD61atPq95cpXBgRHXROyMCF9boJxDvCKhwfaoYKveYfSVuuxPPlqF/aN7Q72lU2
         NKlp/CL6UCJeNJkZskAfdc8TsnXyLSwu1v8dOjDUfUJ/bp/95XUArjyMUhsndBmm3Jq6
         sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wgIK7zbpXWjdXBtD36efr+BpdwUj1e5hEN/TLn+lrLU=;
        b=MHPcCUf0ezxX3WZvMWGh0zLspv9dRe0vAQcV+D/6wVw9JTz3oEdacbQOiPuuIhpasE
         FcRwUhXsqni810YvqcIs1fJD/xhO2HVv7VY2WkkA2tBuQiMMqzeUp6NCEWginjb9CE5x
         8fEomDMYs0u5jbEFHSMaLkbJ89UL7iSdV6F+MBT17hK8+BBag7hzA/P22FKuqRR7UcCV
         uqWj+Z9wIG0gcC9zzOB1uGyBgCcQrkxKLuPEI7p092FQSLmW7qYaVeGBI3KZZWt/ru0H
         pWFAl7TMWW7V5IuKUUW56CrLtQi1QSLnX43sxNN8Y+PUGYgiXYabz3vdd0Mh0MuHwNGp
         nUTw==
X-Gm-Message-State: AOAM531/SmqFBnpJBtLY6axhb/FX0y8vYqqc5pO+N8TNNOzNNxwQR6df
        HTYY4q8tt4TciTCtLkLSEoQ=
X-Google-Smtp-Source: ABdhPJxrpkBVAA6JdQfTYxDwTuPP80ZU6BI5AxjEYe66MIgCGLFGv4tARhge9IfakUKqQaIHEP2bdA==
X-Received: by 2002:a17:902:6b8c:b029:d3:f9eb:a328 with SMTP id p12-20020a1709026b8cb02900d3f9eba328mr5248553plk.17.1602785861334;
        Thu, 15 Oct 2020 11:17:41 -0700 (PDT)
Received: from [10.67.48.230] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t2sm44769pji.12.2020.10.15.11.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 11:17:40 -0700 (PDT)
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Poonam Aggrwal <poonam.aggrwal@nxp.com>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <jroedel@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Will Deacon <will@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au> <20201015074821.GG14082@lst.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <8d299e51-2480-28ae-ee1b-988583f0f8e8@gmail.com>
Date:   Thu, 15 Oct 2020 11:17:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015074821.GG14082@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/15/20 12:48 AM, Christoph Hellwig wrote:
> On Sun, Oct 11, 2020 at 05:53:37AM +1100, Stephen Rothwell wrote:
>> Hi Naresh,
>>
>> Just adding Christoph and Jim to cc]
> 
> Well, a Cc doesn't help on its own.  Can you send an actual bug
> report including the setup, warnings and error messages, a bisection
> result and the usual suspects?

I don't believe there is a DMA regression for you to look at, this was
solved a long time ago thanks to Robin, here is the beginning of the thread:

https://lore.kernel.org/lkml/CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com/
-- 
Florian
