Return-Path: <linux-next+bounces-8842-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32FC3502A
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 11:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D43418C1C73
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 10:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24982BE658;
	Wed,  5 Nov 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oWYKHcyl"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D4D29BDA3;
	Wed,  5 Nov 2025 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336926; cv=none; b=ovzfap1xokpkuyYNR/jj3OAa0veSlHT2LFlUe0DWu+YVJa8xe+TVTOn75FXDtQxjiYoKIQGo05zTVhBiRGrKm8gvm/nZ5VpK+V55kFVg4v0nO0jGbLRVMeQGjUGenkSWp8Q2bE/mmOrHsvSytat2RNd/XdlmZ0l5mCUmU/5Imic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336926; c=relaxed/simple;
	bh=b4G2zeVXU6euODH3y7RcotjKBo1w3IGqDZtodg2/qCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmUSrw5ZiqWxrvCwYMalJopjIVRM1jt9gviAES0KMZeEZJTVUlWuzzQEAo57igJyK8/d9QlaVUXWM2f89YXNeLPoGY7d2B4csxyXKQcATbKiMvzg6yhHkdFd8oU5JZrqhvSvRxyMyyQA5Ccx50gkWsmrnmIh+794OGFCs5wKF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oWYKHcyl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LP/28s1ENSI5KD0aMJx6ScvX4exRH3lePwCwxcDsgRQ=; b=oWYKHcyloz4ffBr5g/LYVKcDFu
	YXgjr7uNkm/4p71KRwRbQFWkQ864A0jt1YKf2v5IskxgvsqOYW/+DyPvX011N50MCzIQeXh47ZuqD
	pq9R6T3RkXayNivO2IsHn6pj6hR8Hhs0GZ1aQcgT90Uc768PSeMX9BHF+LnAEG4eOO9FoSW54duDp
	Vwy/qxa9QE7bfet9h5wjKQ6jWqj0lDRIwK6/z0FVGJ6kn04yqK3XOHn+AR7bFXKh1gB+D26NHQKhp
	uHWgH4YwZG+dHrZK06IO0XWP7azOH368kUZ4hACDyb+/Dp3qx8Pyyjv5XlMs63b7MPLVaFUg05M7M
	504TeZzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZTN-00000001oUK-3cxC;
	Wed, 05 Nov 2025 09:06:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9F0A830023C; Wed, 05 Nov 2025 11:02:02 +0100 (CET)
Date: Wed, 5 Nov 2025 11:02:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105100014.GY4068168@noisy.programming.kicks-ass.net>

On Wed, Nov 05, 2025 at 11:00:14AM +0100, Peter Zijlstra wrote:
> On Wed, Nov 05, 2025 at 09:56:37AM +0100, Peter Zijlstra wrote:
> > On Wed, Nov 05, 2025 at 02:30:27PM +1100, Stephen Rothwell wrote:
> > 
> > > These objtool messages have returned today.  No change in compiler.
> > 
> > Yes, Ingo also reported them on IRC, let me go investigate!
> 
> The below cures things, but I'm not quite sure why they show up now and
> not before. Let me poke more.

Also, someone wrecked the build system.

vmlinux.o is no longer a valid build target, and the vmlinux target
seems to build a ton of module stuff :/

