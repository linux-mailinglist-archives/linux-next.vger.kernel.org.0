Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB7647E8F7
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 22:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbhLWVRi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 16:17:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48312
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233222AbhLWVRi (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Dec 2021 16:17:38 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA8033F1B2
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640294256;
        bh=wSZODWSU4DKXu9p3Iy+JEhsRjXghL/NqBI5nvfYw29Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TOlQVZm5UYwjVKPHStp5yEnuEBAaTyycDc5NoVGV+VAd8y4EGRNfl1ME00pCvubAJ
         RPGdcBLPt15S1H3Z+L1VGrKdbglXtqcBotoJ12OtuqDTeveJzhUqPspR16WlOIvp5s
         WJ4H9HEQ6dRvh4AYwOjQeAy8ZZgMMcPAMP2t8TDTPKaqYqQ3SvvelVts6oU2rzGkbB
         sTyxwSAWQA7AwJnmuzHD7logXgtZujezdcXDeau1W8OAW4gV5ZOBJ2sUkIdZ+xgqpw
         Yy6QX0DU9StOYd7969lJePYfNdRlreX7PR5RRh0yL1gpshTJTQGOYXMvIydestu2Vk
         48W36QepUFNuw==
Received: by mail-lj1-f197.google.com with SMTP id bd7-20020a05651c168700b0022d71e1839bso1907970ljb.9
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 13:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wSZODWSU4DKXu9p3Iy+JEhsRjXghL/NqBI5nvfYw29Y=;
        b=cjXozTo76Moilqu1TZ3qyvDrIzHDWL2b95MNjxZCxlvndKeByR17cV4gJKiCRQ5745
         ngVnhb+4temjGGPIE570QCy0V57E623TbjMgaKt2eDToMo3h6nfCAoTkxyd0U04MtjEr
         kw2nonjYB8DMRE0qaC57uSwGhNCc7VDwMp/tVNKCBQN8t+UiLrdzli0+d9ELy5Wz1D0Y
         WaVYxxs85ZufvA5PBUWa1n7KN7qMCc95FP71D/5Yy00ZQruKr43i4Xay2fQgveOxcSY2
         xUhSaEylxGvDcgCZdMAhkeTeegqsT7ple1WRfRN3Mc+ZFuWIYZBn5c9U4in/JJqPA/z4
         lOlQ==
X-Gm-Message-State: AOAM5339wOiicA6nAt/aFz9VXx3AT2Ulom4bm70VR0uiyXZsUO5CZE90
        8CAjjj5FI0gZrC4Sqym1fBcJw3+bMCE40pVlS3DGfA5EjAyyX8oVXJTEbH6FpFydlf4Rdh0BARN
        7J00f3dV+Kfeu6mUJuLyUWJFNJEu2TfXMzbp6VdQ=
X-Received: by 2002:a19:490f:: with SMTP id w15mr2944212lfa.278.1640294256022;
        Thu, 23 Dec 2021 13:17:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDB99L3XcrLuvZwJ9zWTCacN2IPGrVbY0jL0JnDc+/zEbdPYRnRWDt/Pvv8w5u+qTkCe7dTA==
X-Received: by 2002:a19:490f:: with SMTP id w15mr2944203lfa.278.1640294255840;
        Thu, 23 Dec 2021 13:17:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u8sm615629lje.91.2021.12.23.13.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 13:17:35 -0800 (PST)
Message-ID: <ce08a9b7-4fc5-2cc7-2a5a-dbab6eabea14@canonical.com>
Date:   Thu, 23 Dec 2021 22:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: linux-next: manual merge of the nand tree with the drivers-memory
 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Roger Quadros <rogerq@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211223104704.35fa3a41@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211223104704.35fa3a41@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 23/12/2021 00:47, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the nand tree got a conflict in:
> 
>   drivers/mtd/nand/raw/omap2.c
> 
> between commit:
> 
>   f2f8115fe8b3 ("memory: omap-gpmc: Use a compatible match table when checking for NAND controller")
> 
> from the drivers-memory tree and commit:
> 
>   0137c74ad873 ("mtd: rawnand: omap2: Add compatible for AM64 SoC")
> 
> from the nand tree.
> 
> I fixed it up (I used the former version and added the following patch)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 

Thanks Stephen, the fix looks correct.

Roger,
It seems you sent two separate patches touching exactly the same files
recently for two different trees. One for memory controllers moving the
NAND ids and second for MTD tree with adding new compatible.
Please don't, instead second should base on the other and these should
go via one tree. This is a non-trivial conflict which could be avoided.


Best regards,
Krzysztof
