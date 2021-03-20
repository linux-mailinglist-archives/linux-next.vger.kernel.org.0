Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89DA342ADC
	for <lists+linux-next@lfdr.de>; Sat, 20 Mar 2021 06:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhCTF2D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Mar 2021 01:28:03 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:54865 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhCTF1n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Mar 2021 01:27:43 -0400
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4F2TmR5vMGzybF;
        Sat, 20 Mar 2021 16:27:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1616218059;
        bh=8bfAd/jMqO33tgHSSTkbsT5Gp7ae7kN4An4pW8GmkYA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ndbjen12PYA47KKU1MitsgsU//u3oSDmtopxBcZ80lrcczM90crNcZDgqJrojyzcR
         B40X6a/jJ3tgwS1AdXmZE/bjqtia3HlEerO0GLpV2VTkYVUW6YrazRZ8IBCmrEViGR
         9TcP2PzZNzpNqceCHFCPu8/AQwkip8q2nxc9k2zmwJVr3+ZZXqmOa3fAwX+tpOAfS5
         GPAYoWXZ7Tg6Zo+L29iQetXL11xf0KQ/VtTCffIO33Y1ES6dv++UXeBNywNt6QUElj
         X3FP8DGDVqZF6qn3JXCDZ4I5dkhurYGXAMpAlXIvMbjSQtmkYh1Sy5fjzZLkJuRKhq
         UOf7KMLMywbaA==
Date:   Sat, 20 Mar 2021 16:27:34 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Subject: Re: linux-next: Tree for Mar 19
Message-ID: <20210320162734.1630cc55@elm.ozlabs.ibm.com>
In-Reply-To: <YFS1h6h+71sRlwFR@osiris>
References: <20210319175950.509fcbd0@canb.auug.org.au>
        <YFS1h6h+71sRlwFR@osiris>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On Fri, 19 Mar 2021 15:30:31 +0100 Heiko Carstens <hca@linux.ibm.com> wrote:
>
> This breaks now on s390 with commit 8ef6f74a3571 ("Rust support").
> make modules_install / depmod now fails with:
> 
> depmod: WARNING: /.../lib/modules/5.12.0-rc3-00001-g8ef6f74a3571/kernel/drivers/s390/scsi/zfcp.ko needs unknown symbol
> 
> for every module (yes, the line is complete).

Daniel Axtens reported the same breakage on powerpc.  I bisected it to
the same commit.  More experimentation shows that if you reverse just
the change to include/linux/moduleparam.h the above warnings go away.
So

-#define MAX_PARAM_PREFIX_LEN (256 - sizeof(unsigned long))
+#define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))

fixes it up.  Not sure what that does to the rust support ...
-- 
Cheers,
Stephen Rothwell
