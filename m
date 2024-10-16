Return-Path: <linux-next+bounces-4295-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC99A00EE
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 07:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564842859A4
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 05:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF89718B462;
	Wed, 16 Oct 2024 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="TaoZhEVt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gG1mxMCz"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539318C009;
	Wed, 16 Oct 2024 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057751; cv=none; b=B06YU5NtKS1L8suYSH7m5h4FrE9z3tlMXOZtqexvx4ZuVC+IoIulwB6jU2ci4003LWJRG4cjYQmKgOyBynhu5r509ckURWVFE/q/ST726SxIXy3IFXVBeZlMQSYnnF4Lw19NmLyD7mQoctpocgPD+DEzFi5mUyAySpucLfoxWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057751; c=relaxed/simple;
	bh=CWkcxnI1jk2t84JWpgraUHcWI9ULAqacx4zK0DAhfWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+s//2bbStFX4HgWEXrxxOaLb81+buJUjlSnqCSOJcQgp+YBTfz6pX+AALttcxS7MFKo1BBGv0Tk5D0dVHo0NCJUtZJGfROtcXESLOQmiUwx8rMbFPzscdUsnBT81WlTO8//dHOyh5J/mGWFmTjCUZwjT/DHaP8uH0/Se3FKVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=TaoZhEVt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gG1mxMCz; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE8B8114017E;
	Wed, 16 Oct 2024 01:49:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 16 Oct 2024 01:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729057748; x=1729144148; bh=KhDWoasjtm
	2L2ftKVOHUI2NQJxbxaDmQRNOWot0/7pI=; b=TaoZhEVtNj8rRVxkYhOaZlMVE4
	uV9oTyrHgrtDfltzXYCFi/ml6O9WFf8dDcruTOGe7vOgyMv3e+adXjq6VQYFJCe/
	T+VPW8pZsF24R2ba7y7GjUPgifMK7mDq7OPS8GVoiAhS1hOGfUMYJR8TmSvPWIY6
	a6mw2gxjgI9Uj813/o/pTwXjP4n4GEagnSOg4j+V4OmBzf7stbAANK9zIW7LXhNu
	6M4TP/6wb1RtkXd7tjCPEG9D/unHazFhcbHfvsXn5Fp3gWUALX9amiiXwg6DeGCC
	zgny9p7iZbuWRlc7ZpvkXuwEz9otlxGNljUqG5a5QKi5iMbt7k+PNhc8eWQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729057748; x=1729144148; bh=KhDWoasjtm2L2ftKVOHUI2NQJxbx
	aDmQRNOWot0/7pI=; b=gG1mxMCzOlpI6bFnkBN40BIkUAlRixtAOzi+H+Ur1+g1
	7jjHQojxnHX4ZtWfv3bBV00qszJt2urwqaX96xXWXby9tuGAQ5qEt4NgwF3aTVCp
	hbm1wNu1YzPSWYBP7FOFUJEZWwHZfvfdxED8lUH7Xd9pMG+n6qkOTi6aTqkcqmd2
	ik6kzzPd8uNa6tr8mxZfuTxiz17yg5/zmMUcJbZm8RECWiP34PdU57CcLK1DKKL1
	caWgXHgctA9dPSafrPXGVBXoA2XPqrl3QrajaIvDufME0yYfpZGE0qBDTIs12PGc
	VaINLNc4WY3QQCnWQfLyUgQhbsDki8SgwJCA000fyw==
X-ME-Sender: <xms:1FMPZzwJrlarAjwnpWWbKNb3ahtCHVQ14CPWosY1iCxKy_MHLdFPmA>
    <xme:1FMPZ7TyqxeassINGvfDZln_6ui-PLcYg_KqYPhiwsS7rYDXCkuGl3ITN62U8nmpO
    9qp5MOC7lKT-Q>
X-ME-Received: <xmr:1FMPZ9VmlF2xGdllTHJp6rjiQ1mkw-3yQm46kFHdSmjJfPhY0Wzs2KWRbGnglOHiQY3zHtwO8ci9tysRfFqE0ZPkWpLteP9UJGeqgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegkedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1FMPZ9iS0vP48-KacJJegnIEy8ZnC8IYYhlaiyrwPMCre61vLvJ-rQ>
    <xmx:1FMPZ1Ba-usKjeQ_D7LwypINYj89OUnsSfvuJTX3dlCS5KkB2_FPXA>
    <xmx:1FMPZ2LwYomvRoo53v49zXNPbIDsrwgG9zTzdCzsQGXsbRqJTce5RQ>
    <xmx:1FMPZ0D3DWxbbqNn_w9s2DBWKhNCrNIOOEce7r0nsppRfnk2FjZ9ZA>
    <xmx:1FMPZ52urpuadFdReHqksnzoY7SrcdRf7GonRN5kgP1aAN2ImOoGXAP0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 01:49:08 -0400 (EDT)
Date: Wed, 16 Oct 2024 07:49:03 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the driver-core tree
Message-ID: <2024101651-craziness-diagram-ddd7@gregkh>
References: <20241016151230.41896b5b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016151230.41896b5b@canb.auug.org.au>

On Wed, Oct 16, 2024 at 03:12:30PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the mm tree as different commits
> (but the same patches):
> 
>   9bd133f05b1d ("lib: devres: Simplify API devm_ioport_unmap() implementation")
>   0ee4dcafda95 ("lib: devres: Simplify API devm_iounmap() implementation")
> 
> These are commits
> 
>   a508aa764a55 ("lib: devres: Simplify API devm_ioport_unmap() implementation")
>   e16fbbc11039 ("lib: devres: simplify API devm_iounmap() implementation")
> 
> in the mm-nonmm-unstable branch of the mm tree.

Yeah, we both picked these up, all should be fine.

thanks,

greg k-h

