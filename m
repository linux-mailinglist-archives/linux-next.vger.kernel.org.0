Return-Path: <linux-next+bounces-7195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFFAE2C21
	for <lists+linux-next@lfdr.de>; Sat, 21 Jun 2025 22:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F9C7A7AB5
	for <lists+linux-next@lfdr.de>; Sat, 21 Jun 2025 20:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF941F1313;
	Sat, 21 Jun 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GGRyvT/n"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBA211F;
	Sat, 21 Jun 2025 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750536712; cv=none; b=nQ/nbdg8yjGFqxzdXxvPrbvGXC4VMMtd2t8fS23OZzcZlJtnORZNECtUREtoJQk3/5nx6vV65ww8For835s5qNs7sE3NYOzuZjKrTHExmcUG0ticjcLzvhhGojravRLI8fPYKPOgS+2/hrvhV0CFcBqd3a0kO4kI1vfoQIIZyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750536712; c=relaxed/simple;
	bh=WqDdctZTGYONvZzYdtLkxiKROygIlGqUtAxC3/W6FpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ql9peK/1bgT3bReA8lneZqso4OIv63K+aP/rHEAamewc4V297hAz04KS7SqOJxsh7r9VDtQfrX8mK7ZjrcKtPUXsL3ZGGzv/Yitkv5pAXO4A2Y63yVjr71Xbi8sUCUeqG0xMK8MbJTBwpP8+7YGE/2tVCN+HjYx/c4X03N8gqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GGRyvT/n; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E1FDE41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750536710; bh=Bwcpl3InaL+OhwjLS5pcIaxw1M92sU/tgiP4nfYxGsE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GGRyvT/nIonW3r4pCoXeCJoExImW083nGWzW1/yrGnFqqdykrcjHmw3h5LZBZX4dA
	 +F2SDt/rLTkGOncQZYELK1zhfrAajQXK0Y6zMt3XSxQ/V6NLdEZKppD07fjHXTrKCi
	 6SE/wj0oilDU4G8n/VeoSu+tZxauCoB8WK4ZWVxYUh+6SJIcFfNvAusl7uIfu3lR2q
	 TuHUdUOyjss+9TyExTkmg2AuhLUb97q9HQZnSZ+O05Dt416oRjQn0UcDz1P0dED/Te
	 tFx2LVe+3JSevG2hWRJfuvhwi0osceH2zexMd95UqHvSftm2PhCvijrC1sAAKwiFv0
	 /TfTWNp52lb3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E1FDE41AD8;
	Sat, 21 Jun 2025 20:11:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: shouyeliu <shouyeliu@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au, shouyeliu@gmail.com, shouyeliu@tencent.com
Subject: Re: [PATCH] Documentation: amd-pstate:fix minimum performance state
 label error
In-Reply-To: <20250620021658.92161-1-shouyeliu@gmail.com>
References: <87jz57h6us.fsf@trenco.lwn.net>
 <20250620021658.92161-1-shouyeliu@gmail.com>
Date: Sat, 21 Jun 2025 14:11:48 -0600
Message-ID: <87bjqgdfcr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

shouyeliu <shouyeliu@gmail.com> writes:

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
> diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
> index 412423c54f25..e1771f2225d5 100644
> --- a/Documentation/admin-guide/pm/amd-pstate.rst
> +++ b/Documentation/admin-guide/pm/amd-pstate.rst
> @@ -72,7 +72,7 @@ to manage each performance update behavior. ::
>    Lowest non-        |                       |                         |                       |
>    linear perf ------>+-----------------------+                         +-----------------------+
>                       |                       |                         |                       |
> -                     |                       |       Lowest perf  ---->|                       |
> +                     |                       |          Min perf  ---->|                       |
>                       |                       |                         |                       |
Applied, thanks.

jon

