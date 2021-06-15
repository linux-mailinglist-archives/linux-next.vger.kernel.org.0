Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA5D3A7762
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 08:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhFOGxs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 02:53:48 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37420 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229493AbhFOGxr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 02:53:47 -0400
X-UUID: c282a59e0cc94007bb756791991e096e-20210615
X-UUID: c282a59e0cc94007bb756791991e096e-20210615
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1436944670; Tue, 15 Jun 2021 14:51:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 14:51:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 14:51:40 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <rostedt@goodmis.org>
CC:     <ardb@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-next@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <peterz@infradead.org>, <sfr@canb.auug.org.au>,
        <yj.chiang@mediatek.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Date:   Tue, 15 Jun 2021 14:51:40 +0800
Message-ID: <20210615065140.22032-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210610110638.7e84912d@oasis.local.home>
References: <20210610110638.7e84912d@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> 
> On Thu, 10 Jun 2021 10:26:39 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Thu, Jun 10, 2021 at 06:08:25PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the ftrace tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > Cannot find symbol for section 255: .text.opal_int_set_mfrr.
> > > arch/powerpc/platforms/powernv/opal-call.o: failed
> > > 
> > > and many more similar.
> > > 
> > > Caused by commit
> > > 
> > >   9e419de4c678 ("recordmcount: Correct st_shndx handling")  
> > 
> > Argh.. lemme try and reproduce :/
> 
> I'll go and revert this patch, and wait for a new version from Peter.
> 
> Hmm, crap, this is also sent to Linus. I'll stop that too.
> 
> -- Steve

I found the the build fail is because PPC64 is big endian and this
patch use st_shndx directyly.

Here is the case which cause this problem:
recordmcount search symbol for txtndx = 255(0xff), but the
corresponding symbol has st_shndx = 0xff00(bit endian) which
equals SHN_LORESERVE, so the updated get_symindex() return 0.

I send the patch v2 to fix it.
https://lore.kernel.org/lkml/20210615064720.21950-1-mark-pk.tsai@mediatek.com/

Below is the test environment I used:
https://musl.cc/powerpc64-linux-musl-cross.tgz
make allyesconfig CROSS_COMPILE=powerpc64-linux-musl- ARCH=powerpc
make vmlinux CROSS_COMPILE=powerpc64-linux-musl- ARCH=powerpc
