Return-Path: <linux-next+bounces-3058-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C59934170
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 19:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA62C1C21509
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403281822F1;
	Wed, 17 Jul 2024 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhxS6Xuj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118291822CF;
	Wed, 17 Jul 2024 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721237082; cv=none; b=S6I4ZIyf1itfPJNKhXrc3LjZeVj+tXdllkWUB9fdkgpGzt+H0yoUZ9cjPT+gpGM4vVfqLGqHGKPXjWKoGwTqjrhk1QnIAl9JYMNXzbJr8wLxRd5VfBSD1dgbEkAXdgcjeu6jZRTuIWmpCq+mgl9ywMWO1W5wInXJPXpEpmVjXUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721237082; c=relaxed/simple;
	bh=D8epCKoY4FNil9oSPW5EyEAKsy/x9MI74CLLP+P0SGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpJCBW1MdFWzPpXs364jkkNnXvqP3+KRThkQnIZDeHb2YwsajH400RyHebFHHhXhgZLDo/VBIxXjLaJAw6bJJ18appANe0SxY1kewCBJ16e4pX1fOwZMPEx2lP5t1XrXH4UqiY8jpl5fQjsm6ONfnXDZ7AcH12JQJpbvKM8Gso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhxS6Xuj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDC1C2BD10;
	Wed, 17 Jul 2024 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721237081;
	bh=D8epCKoY4FNil9oSPW5EyEAKsy/x9MI74CLLP+P0SGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhxS6Xuji/gNXUokphJsJULUcVUAYjGRlT6LK7LaoQG2hGpXvTjFIYjqJQkR9Fdkt
	 L8WH7iomQqq03Gp3PobYl5HFcD57xnazQAEeQK9u3wmB5VahVd1WSiytB8Cy7yUooG
	 FYxuHlfVCVewMR6aTPd6uawb3QutUzTr0LgZPWwQqHXZYUR9fyIly5qD4R/i5VYshP
	 7nLhLy7jgPIH9cohR4d7CwMgkVSubrDOg/k7rdw5R0gRW/cS2Yl/G6of23TT8RwzBt
	 sRdqICT6++CACuALaYovSmRmxMMJ3fkF3suVhLkte7zJ5kw9jVHTYWEYYq8ZWi7exZ
	 42GRp1sheEIUg==
Date: Wed, 17 Jul 2024 10:24:39 -0700
From: Saeed Mahameed <saeed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the net-next tree
Message-ID: <Zpf-V94ekDsOjMdc@x130.lan>
References: <20240716165435.22b8bfa5@canb.auug.org.au>
 <20240716060413.699a9729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240716060413.699a9729@kernel.org>

On 16 Jul 06:04, Jakub Kicinski wrote:
>On Tue, 16 Jul 2024 16:54:35 +1000 Stephen Rothwell wrote:
>> include/linux/auxiliary_bus.h:150: warning: Function parameter or struct member 'sysfs' not described in 'auxiliary_device'
>> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irqs' description in 'auxiliary_device'
>> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'lock' description in 'auxiliary_device'
>> include/linux/auxiliary_bus.h:150: warning: Excess struct member 'irq_dir_exists' description in 'auxiliary_device'
>
>Shay, Saeed, could you send a fix for this real quick?

Sending now !


