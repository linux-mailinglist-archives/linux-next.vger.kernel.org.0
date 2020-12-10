Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3FED2D4F4A
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 01:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgLJAUh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 19:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgLJAUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 19:20:30 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38990C0613D6;
        Wed,  9 Dec 2020 16:19:50 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrvgQ2qq8z9sWC;
        Thu, 10 Dec 2020 11:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1607559586;
        bh=2Nou4BXsnpzOz5P0S3H1qxqKUObLSPTluDR33OT2IDM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=aFrvJQjwFt1M/PUMiDv7LLx1+QJwBMvHd7m8m9oMIMJl3AVyUg1VHHl8hvczCS3zc
         WSUwd2N+LsH2O0+xzcHVHBSm9E/aWjwxjuvt6O3wgTcReinTodWQSGrpWZhcfDyURQ
         qCr6Tx2c1SXkgVPDe8B+nrZDFDm7rYoB+W9P50yJEllX97Czg5z8HxNWE63UcpqtdS
         t2k7+f0neFz6m8bNykh/1tkDWB7iCrERZ+aVjPtMNc9Rf1Iyz8qBfxLi/j/V4JKdtx
         pvFQ7CK4riOAPdoZFO7/sIVTTUG+yrul1f/crQe//R4W9E9Hc3ydFAfQnmctCSCyBo
         +Zi6NW0aQt3jg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Malaterre <malat@debian.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
In-Reply-To: <20201209180703.404eb4cb@canb.auug.org.au>
References: <20201204210000.660293c6@canb.auug.org.au> <20201208230157.42c42789@canb.auug.org.au> <87r1nzsi4s.fsf@mpe.ellerman.id.au> <20201209180703.404eb4cb@canb.auug.org.au>
Date:   Thu, 10 Dec 2020 11:19:45 +1100
Message-ID: <87im9aseam.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Wed, 09 Dec 2020 15:44:35 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> They should really be in DATA_DATA or similar shouldn't they?
>
> No other architecture appears t need them ...

Any arch with orphan-handling=warn should see them I thought?

cheers
