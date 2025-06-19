Return-Path: <linux-next+bounces-7185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19675AE0DF1
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 21:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71C71BC5789
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 19:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3BD1E8342;
	Thu, 19 Jun 2025 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gHT7C1tb"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53AF2AF1C;
	Thu, 19 Jun 2025 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361109; cv=none; b=ctluJqX2qC0qljgdnSMBREEqzTzQjYmv8d+GLcABsXw1kIepXWIuIyp9uQrCvVryfkZ7fTCKQ9LIzdmQ+xN3GKnNUpm+eh/5OF0KxYFVBp00OFRrUt5n58wVnqY+A8Nh0INVLm8gstudaUqF31Z1JbzEKROTLO914PIpRMiVJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361109; c=relaxed/simple;
	bh=H23xrDQrYj0dexkqJELNyAClHrpIPKdoiapqes/psFQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gzplONplfLP6W4fX3TdijMaTG6CJSsJLg+EQz3L/yH9OxOfcUzj8wjglXTR2qNTSX31s5HTgkimXsLsRsn9W8IiQgVeVFcaGNdFmFdK3tpv5O/SnlNPcJscC31iI2sbwyu7bVgEDc4mRvThNwvxQeBYHY8efRFNW74JPLKoohHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gHT7C1tb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C3B0741AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750361101; bh=h2xYYZOqqr8yMP/VPqfTyZFX+GzYmBARh4FQh1hqKZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gHT7C1tbpcjcMCd1sss2j7A80ZEk8ZlYtzWrITGFfTdL6j8skm9xjk2F9vWmJO31k
	 q4XvwgEb5UbxLbZ+8zQ2D2TvUV7E6xrwoinU1imlwJrUEPwI8xwsWNAPNIkCfcnQWk
	 LYddiInvIoTyYq5LyHvRMsk8/0wKFSUucyPqddHMf3ByWYtxg5lcjN1hSb9EhLzYbn
	 etpwb26jz+FJe0uiBF+uvYSTy7KSEa9oAqB3nuVvYJIztGZ1T93Nys+UFQ8z9ZOdsr
	 gXiSjsuLHp/frRXDH2I6X/j7LjJ9SrZlO+P5Y93y41KSTRGoKZayRqkB6qDfjaIdkd
	 hyoEJVlBotyBA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C3B0741AD8;
	Thu, 19 Jun 2025 19:25:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: liu shouye <shouyeliu@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shouye Liu
 <shouyeliu@tencent.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
In-Reply-To: <CAAscG3X1Rg3YE3+FvNuyK_0eRtz6Q7FgAJBW0saNYNQkigPZzw@mail.gmail.com>
References: <20250610081759.185e7982@canb.auug.org.au>
 <874iwo8shn.fsf@trenco.lwn.net>
 <CAAscG3X1Rg3YE3+FvNuyK_0eRtz6Q7FgAJBW0saNYNQkigPZzw@mail.gmail.com>
Date: Thu, 19 Jun 2025 13:24:59 -0600
Message-ID: <87jz57h6us.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

liu shouye <shouyeliu@gmail.com> writes:

> From: Shouye Liu <shouyeliu@tencent.com>
>
> In the AMD P-States Performance Scale diagram, the labels for "Max Perf"
> and "Lowest Perf" were incorrectly used to define the range for
> "Desired Perf".The "Desired performance target" should be bounded by the
> "Maximum requested performance" and the "Minimum requested performance",
> which corresponds to "Max Perf" and "Min Perf", respectively.
>
> Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
> ---
>  Documentation/admin-guide/pm/amd-pstate.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/pm/amd-pstate.rst
> b/Documentation/admin-guide/pm/amd-pstate.rst
> index 412423c54f25..e1771f2225d5 100644
> --- a/Documentation/admin-guide/pm/amd-pstate.rst
> +++ b/Documentation/admin-guide/pm/amd-pstate.rst
> @@ -72,7 +72,7 @@ to manage each performance update behavior. ::
>    Lowest non-        |                       |
>  |                       |
>    linear perf ------>+-----------------------+
>  +-----------------------+
>                       |                       |
>  |                       |
> -                     |                       |       Lowest perf
> ---->|                       |
> +                     |                       |          Min perf
> ---->|                       |
>                       |                       |
>  |                       |
>    Lowest perf ------>+-----------------------+
>  +-----------------------+
>                       |                       |
>  |                       |
> --
> 2.19.1

This patch has been severely white-space mangled by your mail client.
Care to retry after verifying that you can send patches without this
sort of interference?

Thanks,

jon

