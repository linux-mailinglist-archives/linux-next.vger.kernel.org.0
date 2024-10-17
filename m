Return-Path: <linux-next+bounces-4324-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E006B9A2FAD
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 23:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AFDB1F25CD9
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 21:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F9317C7C6;
	Thu, 17 Oct 2024 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gmQiE79s"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B02136658;
	Thu, 17 Oct 2024 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199801; cv=none; b=Hzc2o+ifYrBzCGjQfHZ5/GSSBUsLuN4XiYzmEAW1RlyCYGMtxUd53vEN559ChqlwNO6DyOsKLfcvc7eQHkLWrFpnuJnD6UjQ8sWjSP5/ie1Dl/YuT4LqOx+RfNSODaJ0dvv5dnghHPtYTXl8YBO47yRESgzVvvRV7vOJXo9y57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199801; c=relaxed/simple;
	bh=w+clCcUh3URkqUIdVz4bfN3dgFCsfy6RBF0xNRsmo1I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CnQNWybxhprcC9qAxovfNX/Ye/t9yu7TciQS/Iv05E7O6eexx61F2jTYU1jsOB91SmtDdodi/VjBWSD6qW/iWRyz5hEMWArpoxdrJUBPN+NaI9GwNCH6QybVu+aczfgPog4hzwnk5mHwhhoXXh9BWLWbCXUIq7l4KMW6nTZR53Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gmQiE79s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2DDC4CEC5;
	Thu, 17 Oct 2024 21:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1729199801;
	bh=w+clCcUh3URkqUIdVz4bfN3dgFCsfy6RBF0xNRsmo1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gmQiE79s9zdqjSEooOxzFhojUoMg/v/7Jw4xdmj6Vqz85v6pDP0Ww6i9UN2AGxxL3
	 FH36shz+bQf9dG7AxZ0kfl87/7WCxkgFQYXSB4t55J2jiO7jsui67dJtHxgwXG0SNN
	 p3syU5JxGz6O4P6lCVrKbpdul49qnV8AwgEIDgNM=
Date: Thu, 17 Oct 2024 14:16:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-Id: <20241017141640.1034010108566f99ed14af8f@linux-foundation.org>
In-Reply-To: <CACzwLxgCAweP=VKcmyzHDib5Gx6t7muqEq8rOvcbKp57doiNmw@mail.gmail.com>
References: <20241017194358.4e670183@canb.auug.org.au>
	<CACzwLxgCAweP=VKcmyzHDib5Gx6t7muqEq8rOvcbKp57doiNmw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Oct 2024 21:53:18 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:

> Should it be sent as the separate patch based on -mm-unstable tree?

yes please

