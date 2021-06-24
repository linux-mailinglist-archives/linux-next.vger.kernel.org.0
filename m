Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8823B2993
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 09:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhFXHpO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 03:45:14 -0400
Received: from ozlabs.org ([203.11.71.1]:50243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231599AbhFXHpO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Jun 2021 03:45:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G9XDG02mrz9sVm;
        Thu, 24 Jun 2021 17:42:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1624520574;
        bh=S1Cri0CEl9/i+BGSepfeIcNSlu74micR6LxhlLlCkIs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sHE9ossEakf8tudRi4Rf4pwgV+b1HCjsF4tgWfKBNSAK+u7DLD1u4WwEYbtzfwgKg
         YG1ByszBDzY35PNZ6NEzVllJPNFx0aMD9vMfUlYnSgK1y7DEDrvOfIbpw2NvqmJHGj
         XDdCsyTzWCQf0C553MDZh6dFFRkTFZy6TO6AmHFRqVtWiJhmLQEmNFNDHz7rW9C3u0
         fqIsjGfp9fjm8J48r/ybl4Fv5OLwCHKH7dRmvrN9oIsffZCXJ/VGadwUx+bIzrtBQ8
         itBNIz0ub6bT0c1hLTcP6HCaKJgg85F6sTbDi9Vo6vULxToMSjzkl0YqFMSifTgllG
         8+GAFB9K44mEg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc tree
In-Reply-To: <20210622074622.4e483a33@canb.auug.org.au>
References: <20210622074622.4e483a33@canb.auug.org.au>
Date:   Thu, 24 Jun 2021 17:42:50 +1000
Message-ID: <878s2z1zet.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Commit
>
>   77bbbc0cf848 ("KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors")
>
> is missing a Signed-off-by from its author.

That was actually deliberate.

Suraj wrote the patch when he was at IBM, but never sent it.

Paul & Nick then resurrected it from some internal tree, and are now
submitting it on behalf of IBM.

So they are asserting option b) of the DCO AIUI:

  (b) The contribution is based upon previous work that, to the best
      of my knowledge, is covered under an appropriate open source
      license and I have the right under that license to submit that
      work with modifications, whether created in whole or in part
      by me, under the same open source license (unless I am
      permitted to submit under a different license), as indicated
      in the file


cheers
