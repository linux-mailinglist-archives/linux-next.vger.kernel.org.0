Return-Path: <linux-next+bounces-8283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE3B5444F
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 09:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2AA7480DA2
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 07:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3082D4B5B;
	Fri, 12 Sep 2025 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8rMqtta"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EC42D3A75;
	Fri, 12 Sep 2025 07:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757663872; cv=none; b=Fe5hWBAhgxeDIUU6Nf39W+a1bEf01BUu9fPEBjGjL6dRcxO8j5VOy8dogqinUSQY3jVv33HaktnAv8tPpd6d9aRH6h2yDj0DwYu/7J70OmFjHPcpK3nr5W4nljqKwt/RtKq4ggk71quv28vOTMrNVSIRkkaSgsbKtt4QFSPdcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757663872; c=relaxed/simple;
	bh=mrSFWD3DrAqN6uc/sZp0uf0bhoddSlKZJGIH7voKn9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgLdwfqVUaVfXE/jhh3oUnXgkPHm2onReOq5wMl3bq10z0AuWOMidHAaT12KWo7hked1F8TOEn8hnhUtJvJFqcfZr3ofKLjN+r2NWYen/CXzyhBNqL6eysxKl6Ec8TbcS0zDRFg/ck0EQJDRaxom6gL1Yfq7QodT6olDBf1gbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8rMqtta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6BBC4CEF5;
	Fri, 12 Sep 2025 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757663871;
	bh=mrSFWD3DrAqN6uc/sZp0uf0bhoddSlKZJGIH7voKn9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W8rMqttaB4gxubQ+CZK3d7nPI8ekG9rN+qRc/0geXeQFIKxT7UCoFF2SW2m+A7l0S
	 a0WAECVYsUeLb5/LloCkaEOKnKPd+XZFl/dtw5NBAy3lBKpzDnAo4sIFg9XzydxZ4K
	 f9pctyyrtJ4irfgZSvT/t8maOft2wPJeWRm0N720uC6RhAe9WUYlW4sETaYcbhxY0S
	 OJVA5F3Hf5EslOpVgAXA143UqR7i5GrHwmBtGhu4ng6eMk9YDL2dM6+WOsxozqHH/u
	 mq4Yy7RbXWMzKLBbRGNLJS3WH6hyOxNxMjBw+CF9ispN9oxH/EIQMAK+nMt6C+xX5K
	 N3vFPSspaMrXA==
Message-ID: <420eb7d1-466b-4901-b847-e1972ccccfeb@kernel.org>
Date: Fri, 12 Sep 2025 09:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the drm-rust tree with the
 driver-core.current tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg KH <greg@kroah.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250912120159.1d6518cc@canb.auug.org.au>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250912120159.1d6518cc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/25 4:01 AM, Stephen Rothwell wrote:
> diff --cc MAINTAINERS
> index 5bcaa26029f2,8a11e6c5dd80..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -7263,18 -7251,20 +7276,20 @@@ F:	include/linux/dma-mapping.
>   F:	include/linux/swiotlb.h
>   F:	kernel/dma/
>   
> - DMA MAPPING HELPERS DEVICE DRIVER API [RUST]
> + DMA MAPPING & SCATTERLIST API [RUST]
>  -M:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
>  +R:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
>   R:	Daniel Almeida <daniel.almeida@collabora.com>
>   R:	Robin Murphy <robin.murphy@arm.com>
>   R:	Andreas Hindborg <a.hindborg@kernel.org>
>   L:	rust-for-linux@vger.kernel.org
>   S:	Supported
>   W:	https://rust-for-linux.com
>  -T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
>  +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
>   F:	rust/helpers/dma.c
> + F:	rust/helpers/scatterlist.c
>   F:	rust/kernel/dma.rs
> + F:	rust/kernel/scatterlist.rs
>   F:	samples/rust/rust_dma.rs
>   
>   DMA-BUF HEAPS FRAMEWORK

Looks good, thanks!

