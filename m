Return-Path: <linux-next+bounces-342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC480DFC4
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 00:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9261F21806
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 23:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7095456B7A;
	Mon, 11 Dec 2023 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="htUJtlHe"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5190AF;
	Mon, 11 Dec 2023 15:58:52 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31DBF1B4;
	Mon, 11 Dec 2023 23:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31DBF1B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1702339132; bh=diFBzq30leU1F0BF2DVbh0pVQCrFjmam/OhDnPoz/Jo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=htUJtlHe8OCePm6ZDyJuBLp9fuxJE80/d2YGL33dXe8kFVyDCSHxAVyFlxKl22cUm
	 KBghSCgv8J0+UPPh4OljVyRgJFFSiUeKqKFSWa2pn+d+oAgFFRM/SpgDG2+RC0+YJt
	 OCJZy2GhLJ0rAfean9zENO4V8U37wg8RQITFKXA/Hs6vAlzRLRKG3xpHFZlr2D0jTI
	 b2JZpybrMPeLTFVwz1x30fsAwYNlEvg8YeQQ5zV83ESOGCM1lVmE3XV9SVwyqVSYGU
	 bNEgE8+i7Z3KJBjpLy0dW/zjLZxb5Y/UcnnVqGpCjMJU09aRXRyxPBkrLnurGrp1m0
	 KebSFPXtW4vLQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alex Deucher
 <alexdeucher@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Ma Jun <Jun.Ma2@amd.com>, Sumit Garg
 <sumit.garg@linaro.org>
Subject: Re: linux-next: manual merge of the amdgpu tree with the jc_docs tree
In-Reply-To: <20231212104657.524d359e@canb.auug.org.au>
References: <20231212104657.524d359e@canb.auug.org.au>
Date: Mon, 11 Dec 2023 16:58:51 -0700
Message-ID: <87zfygwatg.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>
>   Documentation/driver-api/index.rst
>
> between commit:
>
>   50709576d81b ("Documentation: Destage TEE subsystem documentation")
>
> from the jc_docs tree and commit:
>
>   2128f3cca5a2 ("Documentation/driver-api: Add document about WBRF mechanism")
>
> from the amdgpu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, both fixups in that file seem fine.

Clearly, though, we've run into the "everybody adding stuff to the end
causes a lot of conflicts" problem.  Time to impose some better
organization onto that file.

jon

