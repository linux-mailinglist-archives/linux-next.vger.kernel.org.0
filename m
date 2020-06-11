Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1132B1F65E5
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 12:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgFKKni (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgFKKng (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 06:43:36 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DDA4C08C5C1;
        Thu, 11 Jun 2020 03:43:36 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jjKg9-0007F7-FG; Thu, 11 Jun 2020 12:43:25 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id E6245100F18; Thu, 11 Jun 2020 12:43:24 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
In-Reply-To: <20200611105254.1b14f070@canb.auug.org.au>
References: <20200611105254.1b14f070@canb.auug.org.au>
Date:   Thu, 11 Jun 2020 12:43:24 +0200
Message-ID: <878sgtdgs3.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Today's linux-next merge of the tip tree got conflicts in:
>
>   include/linux/compiler.h
>
> between commits:
>
>   dee081bf8f82 ("READ_ONCE: Drop pointer qualifiers when reading from scalar types")
>   9e343b467c70 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memory accesses")
>   a5460b5e5fb8 ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()")
>
> from Linus' tree and commits:
>
>   2ab3a0a02905 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memory accesses")
>   7b364f0949ae ("READ_ONCE: Drop pointer qualifiers when reading from scalar types")
>   bbfa112b46bd ("READ_ONCE: Simplify implementations of {READ,WRITE}_ONCE()")
> (and maybe others)
>
> from the tip tree.

Sorry for that inconveniance. I'm about to get rid of the conflicts on
the tip side.

Thanks,

        tglx
