Return-Path: <linux-next+bounces-3839-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 684BF9787FC
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 20:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E91D6B207E3
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755E7126C13;
	Fri, 13 Sep 2024 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xlv+s7kP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA907B3FE;
	Fri, 13 Sep 2024 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252581; cv=none; b=WeVdt/5iDt41WvwuX2sFKlSa/2rgV5JWG4dzSQmF2hhj+X0J4bTgUhI/LPAoGkRwdSmjhnYhcCxMaAr0A8+dT6u50YXkhj6xnhK7t9Y/PC66o+0IOcpnd5vKmpnBCpL5N0NQzvHskv7KqL1kHlkO5szXQc8Gq6tvToXFGatoL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252581; c=relaxed/simple;
	bh=DURmSPn3hom3PMUxw/RlZtYS/umXZDq7ki4xEsaW4H8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4kSDtjJmOfLSdZ/FpBg7JoptJKNfYDVpViXCvJC1YRQ+4VptSQRYgytdiN1PiImzFo+aopKBiWJY4hI8KoHQNUe3xuYFi2+nh+1YfJ/FuUOA3dkYE+F0RDoXp5dkrGilLEcNgiw5PjcE0Q4QWthBcfLgnf3eo+AZi0SNYbJqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xlv+s7kP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A3FC4CEC7;
	Fri, 13 Sep 2024 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726252581;
	bh=DURmSPn3hom3PMUxw/RlZtYS/umXZDq7ki4xEsaW4H8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xlv+s7kPhsmgjQZBlLvI3WTkA6JEchOXapISdINJTYfeRg2vU4frhVKqkjOyge/1R
	 mgFpvgCji8IgbyiDL0CaV+ZBFtFJd62/iejaVctLAsScJ8sCYCoaGrvTHRXQWNZ0yQ
	 36MTNljr+yuN+1AwEl2bhfN/CnVGJV0WHerKKENrpO6MY5e8kbuR2GfMurhEb5/Mfn
	 12JvjDcUfbYv/cL/hJ4IJBpDeEUBZhc6x9alaJVRgfD758sRPioXjkJi09oMbkhXuS
	 dR+CBktToH5tvoH/ZO9vfZkGxTpjYOaZwtF58EUtGn2rDTKSvzQ3gD5FCkO8TGffW5
	 uFvfK1+lKTzRA==
Date: Fri, 13 Sep 2024 11:36:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: christophe.leroy2@cs-soprasteria.com, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913113619.4bf2bf16@kernel.org>
In-Reply-To: <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
	<20240913084938.71ade4d5@kernel.org>
	<913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
	<CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 09:27:17 -0700 Mina Almasry wrote:
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 5769fe6e4950..ea4005d2d1a9 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
> struct page *page)
>  {
>         unsigned long head = READ_ONCE(page->compound_head);
> 
> -       if (unlikely(head & 1))
> -               return head - 1;
> +       if (unlikely(head & 1UL))
> +               return head & ~1UL;
>         return (unsigned long)page_fixed_fake_head(page);
>  }
> 
> Other than that I think this is a correct fix. Jakub, what to do here.
> Do I send this fix to the mm tree or to net-next?

Yes, please, send this out and CC all the relevant people.
We can decide which tree it will go into once its reviewed.

Stephen, would you be willing to slap this on top of linux-next for now?
I can't think of a better bandaid we could put in net-next,
and it'd be sad to revert a major feature because of a compiler bug(?)

