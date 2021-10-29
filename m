Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D5E43F6FA
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 08:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhJ2GMJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 02:12:09 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33959 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbhJ2GMG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 02:12:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgX801kSzz4xYy;
        Fri, 29 Oct 2021 17:09:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1635487776;
        bh=vnw0miFcfIDA684tRbLhvT/V8rILiY7O/z4sV5mjqNw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=noHWm7+L0PAAWMmjyDUde0o01varEflNm4Xgq4RUjPwNgSse47j+kg5feuwKEcMzk
         GM21cr6EAzGsSpmXHxynphmH+wLZHFmKZT2PEeoJyKipb30Gz2MV7kmrnKUuT733ut
         l/kp5F01722ahe+glQ6+9M3oQqfbGUw/Vdz3Ip6cl91jAceLkOcbBrxiFhZEDqldCy
         TjhTwRUV35sbbnBuf7LI7PoqQnCzDPQH0OP0wegEwOkKhyP298frmt3OAM7r2o2IQ5
         36LFOHDxZjdlUr3hSHougQ4sXU1xvlf3dI6YdF2jt86AeEOcx5ZmPTuI/WInN+PNMS
         56yfhm4KEQHYQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] crypto: api - Export crypto_boot_test_finished
In-Reply-To: <20211026043815.GA17728@gondor.apana.org.au>
References: <20210927143229.543749f4@canb.auug.org.au>
 <20210927112341.GA22483@gondor.apana.org.au>
 <20210928151621.7aec3f34@canb.auug.org.au>
 <87sfwpbotz.fsf@mpe.ellerman.id.au>
 <20211026043815.GA17728@gondor.apana.org.au>
Date:   Fri, 29 Oct 2021 17:09:34 +1100
Message-ID: <87v91g8iqp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Herbert Xu <herbert@gondor.apana.org.au> writes:
> On Mon, Oct 25, 2021 at 05:28:24PM +1100, Michael Ellerman wrote:
>>
>> It fixes the build, but modules_install still fails:
>> 
>>   $ git checkout adad556efcdd42a1d9e060cbe5f6161cccf1fa28
>>   HEAD is now at adad556efcdd crypto: api - Fix built-in testing dependency failures
>
> Sorry, the fix is in the queue:
>
> https://patchwork.kernel.org/project/linux-crypto/patch/20211019132802.GA14233@gondor.apana.org.au/

Thanks, that fixes it for me.

cheers
