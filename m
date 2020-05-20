Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0141DA8FB
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 06:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgETELy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 00:11:54 -0400
Received: from ozlabs.org ([203.11.71.1]:51427 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgETELy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 00:11:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49RfTK2DY8z9sT4;
        Wed, 20 May 2020 14:11:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1589947912;
        bh=CvJ3PF6B7+bNDUTi33BJP3o11iVrkVe5hGPX18ByTpE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=N2H1cxALj2tLLncIbgwqV7zn0zdLskGE79O/J/FdQ+Avz3bOQIH5qs7fua7VfGtDo
         vzGTdKO7GYA+lfQ9W6YqagcU1SZaFpXthL1fzyM5HDk1Kt2HFV5cmdu2KJFkQcGXl/
         cQKFAUlhllHPb1rb6t5CcHndGdB0FmmBOLcdSFvurDYyfOHcgLJb4NbFp91oAM4wFJ
         gVzxy+g34zQ+6Hq/0fITUO/H58IxkQKkQGdqfjmlpf0LqPLdbBeip9tw3ylM7EEoEC
         m5HYiMultHvUMa2SRJwXk0wxqoTqu7nGoQ3r1mq0XIOqFuID6Tndfx39dWA6ZepLna
         b1/yd1OSLJlww==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
In-Reply-To: <20200519172316.3b37cbae@canb.auug.org.au>
References: <20200519172316.3b37cbae@canb.auug.org.au>
Date:   Wed, 20 May 2020 14:12:09 +1000
Message-ID: <87lfln8cti.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the rcu tree got a conflict in:
>
>   arch/powerpc/kernel/traps.c
>
> between commit:
>
>   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
>
> from the powerpc tree and commit:
>
>   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
>
> from the rcu tree.
>
> I fixed it up (I used the powerpc tree version for now) and can carry the
> fix as necessary.

OK, I guess that works for now, we'll have to clean it up later once
both trees are merged upstream.

I created an issue to track it:
  https://github.com/linuxppc/issues/issues/298

cheers
