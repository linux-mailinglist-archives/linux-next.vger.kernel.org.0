Return-Path: <linux-next+bounces-2800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD64923CFA
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 13:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBCF2873AB
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 11:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8AC15B153;
	Tue,  2 Jul 2024 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPkJYK3L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EA15B12A;
	Tue,  2 Jul 2024 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719921337; cv=none; b=UnV1cXo6Bo1m4e6RF+yEIRUxIMuCH3JwyxAvfKn9jZ01Ay7O94P6Yg7jCh1YlExTkdpIoADpgdc9eR4kF2QnRk6Q3TQE5L5Q87nmX0L9OXIOOro6AdZm4CuaSLMPZcry7fKJfq8TXD/HjzZrAnJNwZw184p7/5eHU8e0HlG672c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719921337; c=relaxed/simple;
	bh=0WLx0sVpAm2PfL4LXPyRIZSBzMFqc5zzhcWp8V1oGZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhMXLmzkCQvk+2m7QIM79RNnIsUemzGo+Qvrz8hSAkqrY7ROUPa5wR2QwZbQFQARtIstJ9YlqzRD7MaL830OUe8UypBv0tN40GrjsVUxneqoLCXEwqxB9jlL3VrosoPNE80720Er9ubW8UCYExZk86ciPa8U3wDsDdR0vyzVFyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPkJYK3L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB26C116B1;
	Tue,  2 Jul 2024 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719921336;
	bh=0WLx0sVpAm2PfL4LXPyRIZSBzMFqc5zzhcWp8V1oGZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LPkJYK3L0EF7ZaPmft0aOZPoTcm1QhgePfpyJD4EYI1TEOIG3tJVXcYWgREHuc/er
	 Aef6Ks3CiQfJW9G7zTnDMi2/6C/6h1QzTjK+6i6jbT5+FsxgcIRrSLNUe/BIPQ+yd8
	 3Z6QHnfSn5gq/8hWGEy1VFfpM/9m/X8mnJZ1HytDRlkTvXKamxeeAe83V1xqXjQWez
	 TRA+Wos9dj3jMwVy5K2aNTDUSlVfE1s81Nmfyl4qzMzKZb/I4MEVAQAOR8UrLL94Jp
	 /e/7AxScUCRNXD8KL82EEXoxQK29Zw2rghMy4XIhSkoAho619jh9xrGLXH7sgZRXi6
	 6MGoTo/MpdUug==
Date: Tue, 2 Jul 2024 13:55:32 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20240702135532.18156015@dellmb>
In-Reply-To: <20240702174938.04c12aab@canb.auug.org.au>
References: <20240702174938.04c12aab@canb.auug.org.au>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Jul 2024 17:49:38 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: ERROR: Unexpected indentation.
> Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
> 

I don't see what can be the problem on those lines. Is it possible to
build that specific file?

I tried make htmldocs SPHINXDIRS=ABI/testing, but that does not work
(probably because there are no .rst files in that directory?).

Marek

