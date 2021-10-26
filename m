Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE0343B096
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 12:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhJZK6A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 06:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235282AbhJZK5w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 06:57:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D60C061745;
        Tue, 26 Oct 2021 03:55:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdpd70qPJz4xZ1;
        Tue, 26 Oct 2021 21:55:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1635245724;
        bh=OnrTAPXPZ+jyXUISVn3DJ5jVIKulOd+/zxbCJGHW7A0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=R3cGNlW8hpOlbcqUwpUZJjXYHIHHzzYl2FlUeBfZb9d/X7si6JlTOPSes3Bkhkna2
         yehKaBG0cIrC+M4iKA8cyyRKhTcPOcPYP60F/UJcMb2LpwSnq8to7RWi5Tc/nDEFty
         JweL9/cF+yciBM0HGW0Opkcdtz0ZVQfHlGd4hKphjzRh0YVDyBr+Cgv2HLQKnTuTd2
         hHrCXC5Z2PI98PMBv6M2IkyVnOtYpYwMG+H3gtTxD10iylkuT7ijCevcqj/E/yhPrE
         5XwYU8916zbSv+lWP5K6oDuoEOPXEhY8NGvMXaS+RGwnRSpwm7tT+V9jySbajOg4i7
         GKZGkmZRTs1lw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Paul Moore <paul@paul-moore.com>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
In-Reply-To: <20211026133147.35d19e00@canb.auug.org.au>
References: <20211026133147.35d19e00@canb.auug.org.au>
Date:   Tue, 26 Oct 2021 21:55:18 +1100
Message-ID: <87k0i0awdl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the audit tree got conflicts in:
>
>   arch/powerpc/kernel/audit.c
>   arch/powerpc/kernel/compat_audit.c
>
> between commit:
>
>   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
>
> from the powerpc tree and commits:
>
>   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
>   1c30e3af8a79 ("audit: add support for the openat2 syscall")
>
> from the audit tree.

Thanks.

I guess this is OK, unless the audit folks disagree. I could revert the
powerpc commit and try it again later.

If I don't hear anything I'll leave it as-is.

cheers
