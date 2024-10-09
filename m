Return-Path: <linux-next+bounces-4196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BEC997799
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 23:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F641C21C6D
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 21:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0891E260D;
	Wed,  9 Oct 2024 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gOGcY4CI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213519006B;
	Wed,  9 Oct 2024 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509772; cv=none; b=FpaMKvW01JWptfWbYbVxDtWHlQasTAzfGu47cossyHP8MwGU/dfO0aSymQczcS26POocvUoGT4Vml6d2P2TQAgkqFNRhLEexngtj6+uYMXgEfgzqPecgHxttWltgEUbz3ivy4xmU8tkSzajIZZN3Cgqfey7abAkWGWhzfAHrla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509772; c=relaxed/simple;
	bh=JjQ58lAi0I4mO9nrVwLWZQl1BVbaTRns7iTVwGFiRz4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CNnCZM+ECH44bWPmNjznM+7BJYg6B6inBCjhmCpPSD1OSPWRtI0w9fmVqv4CeLfqvqNLcGycfmnxEydTK1vUp1XpcRPAhvqOF/lAG6vDEE+KZcNQiziwDLkadWoimQo7VgHNgCqnTFiPosfBuAKQlNvx8n6aZuOdvDzY6gkbrNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gOGcY4CI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987EEC4CEC3;
	Wed,  9 Oct 2024 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728509771;
	bh=JjQ58lAi0I4mO9nrVwLWZQl1BVbaTRns7iTVwGFiRz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gOGcY4CI/E0GxlCF9cNBRjet6aK5De29v5mdO33Qrqd+bQ/2DrXF8y+aAq2R9yKwu
	 KnyreTR6iP/xZcEhTz+g12oxytWU39lq8NZm5V+QQwEJryPED7qvVry6bJXFP818jx
	 yMx1D6eTPz3kD2LjLFj7F464MNSUJ2gan4LxRId0=
Date: Wed, 9 Oct 2024 14:36:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Brendan Higgins
 <brendanhiggins@google.com>, David Gow <davidgow@google.com>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the mm
 tree
Message-Id: <20241009143611.a3d89cdd15451641c92eb25f@linux-foundation.org>
In-Reply-To: <2dda047a-199f-406d-9998-fa85939e8106@linuxfoundation.org>
References: <20241009162719.0adaea37@canb.auug.org.au>
	<b005d39f-2b75-4a26-a78c-5cd8f7076399@linuxfoundation.org>
	<2dda047a-199f-406d-9998-fa85939e8106@linuxfoundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Oct 2024 15:00:19 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> > Andrew,
> > Another one related to move from lib/ lib/tests/
> > 
> > If you would like to take these patches - it is perfectly
> > fine with me. If not I can handle these.
> 
> Andrew,
> 
> I dropped this one from linux-kselftest kunit branch.
> The link to this patch if it isn't in your Inbox:
> 
> https://lore.kernel.org/all/20240924032200.167622-1-luis.hernandez093@gmail.com/
> > 
> > Adding David as well for feedback on this
> 
> David, I think lib/ kunit patches can go through Andrew's tree.
> Renaming is causing merge conflicts.
> 

Cool.  David, I think it's simplest to just resend everything please.

