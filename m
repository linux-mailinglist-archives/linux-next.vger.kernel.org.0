Return-Path: <linux-next+bounces-7297-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590ABAF07F7
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 03:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C241C07593
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 01:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298C217736;
	Wed,  2 Jul 2025 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bu1mHB8I"
X-Original-To: linux-next@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E42F5E
	for <linux-next@vger.kernel.org>; Wed,  2 Jul 2025 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751419920; cv=none; b=UHs2tU2msmX/019s9jUFFjshqOYmlCFvmzWSRPcmlFLopGRHO32zUXEwu/ZlTB02tzapUMG+FOfNDIC4X9zZwP8IyFI0/4Y9H8j4wGlA8w8aTmp7rJAQ7lHFa8hPtgum9hiP3TO7Ulz1r5tJlhCQNyqJOdu3yfem+AVuvSiyjmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751419920; c=relaxed/simple;
	bh=XSu3aev71Tkfvu4vjsBBHHkYHubdoJZoFjllH94R3Z8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=iwPWvVQxRZzHTs/yCo9rj82P9DII1O7h8eLg5E4mD9/4EpePAiCoZoknjY2W6LPtn8OJQ6aL6PuJmP9J5za/9/73kZ8gqhsc8KyVe06r7aQyNShcuVfTujZ42Jhb8K/ifbEc2/0cJ40KFJ0Rtz68q/oeuei9/7TCwhZGX4fkVNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bu1mHB8I; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751419916;
	bh=hk7ZeiYwOz40YUch5aVMcMHStH9+6Z54QC+hnbt5LbA=;
	h=Subject:From:To:Cc:Date;
	b=bu1mHB8I8dJgGgzFe5UcIwj7MQrDplM4UegN72H849eg2IrW5EJ7liLZJUGV3dviF
	 nc/KBxwSK5WtusXVtuXDYq51qxDggLwJ9GEoni5L1cZ6jY2mB4Xbjwd4ydKMKA8UNR
	 HkB9hApAPik3yjT2aPgHFjVxU0EMXf8lXw2apMdpT+TGbppozANseIpvmJuYCQh6+k
	 8YSN2/+qaeUDVhijB2SZjxwGsEnGnHUzzPoz+KNrmcyiTaYQoJsYWr9bMKK4udqtn5
	 TIwTuT5oy6pw0oaIqGzKRiXM0tr4hSJiwyxH+DlmP365l8J/P8jfCpNYyS3tH1kRBF
	 T8xsOpQt8E/ww==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CAFFC640B4;
	Wed,  2 Jul 2025 09:31:55 +0800 (AWST)
Message-ID: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
Subject: Add bmc/linux for-next to linux-next
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Date: Wed, 02 Jul 2025 11:01:54 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

Could you add the following to linux-next?

   Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
   Branch: for-next

This aligns with the recent patch to MAINTAINERS for the ASPEED tree:

https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@code=
construct.com.au/

Cheers,

Andrew

