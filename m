Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C2D438F82
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 08:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhJYGax (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 02:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbhJYGax (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 02:30:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794E3C061745;
        Sun, 24 Oct 2021 23:28:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hd4ld2Lsrz4xbM;
        Mon, 25 Oct 2021 17:28:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1635143309;
        bh=UO+7LTZTfEH3+SFxoPjM7xKmJkD9pA6Voc4UYPRznJA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ea69VD8965Yuq6XlOPvdP5TkWcECD/6tUkVRjODiIvBnHC2hPrs3MlG+JKEVDBbny
         +QOnB1UeABzgl3GQDtx9FjA21wd9q6pwEYcScx4bCNcrPF4xXmU56nENQjlhjxQHT8
         sHid3NV9VpO5lRRVY3pGrPXsnEq4aZtCnR5FjZOVkwgFLygkLqtM09xuRHrAJ1BiQ2
         lhskJB36QZcrS1EfDHVrTsh6DJ0HrMgbMrlIuWt+k0QyIvxcmmFwV0LQxwlR8TV+Je
         EeKYK6qUZfN884p2BiowXNIuQhiymzMvsqFB/uU44LqIheDsNSLHR3xBB14ObvKeYz
         s+6mfoOUuQkkw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] crypto: api - Export crypto_boot_test_finished
In-Reply-To: <20210928151621.7aec3f34@canb.auug.org.au>
References: <20210927143229.543749f4@canb.auug.org.au>
 <20210927112341.GA22483@gondor.apana.org.au>
 <20210928151621.7aec3f34@canb.auug.org.au>
Date:   Mon, 25 Oct 2021 17:28:24 +1100
Message-ID: <87sfwpbotz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Herbert,
>
> On Mon, 27 Sep 2021 19:23:42 +0800 Herbert Xu <herbert@gondor.apana.org.au> wrote:
>>
>> Oops, does this patch fix the problem?
>
> Yes, that fixes my build, thanks.
>
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # ppc32 build

It fixes the build, but modules_install still fails:

  $ git checkout adad556efcdd42a1d9e060cbe5f6161cccf1fa28
  HEAD is now at adad556efcdd crypto: api - Fix built-in testing dependency failures

  $ git show e42dff467ee6 | patch -p1	# apply fixup patch
  patching file crypto/api.c

  $ make -s -j $(nproc) modules

  $ make -s modules_install
  depmod: ERROR: Cycle detected: crypto -> crypto_algapi -> crypto
  depmod: ERROR: Found 2 modules in dependency cycles!
  make: *** [Makefile:1801: modules_install] Error 1

cheers
