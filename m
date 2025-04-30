Return-Path: <linux-next+bounces-6473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C142AA53C5
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6289E9A70E8
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2836B1C6FE0;
	Wed, 30 Apr 2025 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b="ep7WLC+E"
X-Original-To: linux-next@vger.kernel.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761031BE251;
	Wed, 30 Apr 2025 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.96.170.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038084; cv=none; b=cB6JMmgTCX2NWHN4hQC2yjfArbSyCv+falGJEd0wQE6HxS7eqzAcpwSfMa1/abcab4i/zKMAUk8XuJyhh59myFR2HHEcEsHAhebfoDmpXqwVwDTw0DUL87oW6F+2GJXq8LvmnZJRLzcEMGUoHx1/QgJxkNA9NCmzk3xdWs/trbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038084; c=relaxed/simple;
	bh=5ZL/+NkKKP0dZhMg8QSEbjj0bFoy8v/j7dquKHWiKiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6NyGtTdKlhhJtnIDJ0ZbDSkAhTfxuqSaT4LUoslxQKoUePtHjtrTlW2rTYjVjer47LdxSXXr+hhchsvSMEW4hQA/QRo0/gcLXfyRawuMM+pspEH2fDE/zG6Ry9fDptrYETYaSDTWD/I3wPYSw/8+E6N+1yx6sRSgwMGn4rlP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net; spf=pass smtp.mailfrom=rjwysocki.net; dkim=pass (2048-bit key) header.d=rjwysocki.net header.i=@rjwysocki.net header.b=ep7WLC+E; arc=none smtp.client-ip=79.96.170.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjwysocki.net
Received: from kreacher.localnet (unknown [217.114.34.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cloudserver094114.home.pl (Postfix) with ESMTPSA id DCBD266690D;
	Wed, 30 Apr 2025 20:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rjwysocki.net;
	s=dkim; t=1746038080;
	bh=5ZL/+NkKKP0dZhMg8QSEbjj0bFoy8v/j7dquKHWiKiI=;
	h=From:Subject:Date;
	b=ep7WLC+EV+yOFvTiQjnVG3L74xx/TtEpu31bhQXEuq4Wq5nVd3d7O+RoRmUzCmnlo
	 IVUjjPsPis/8VDaFPLPXIgu5BtE7gp7FSCNTdAWM191qz5DaRry7wNe5A27VyxelC9
	 di9fydpUP7/botaWpqBu+9L3mDQUUk6G2P7ofwpHV7zMMK7xus0DF8U1byB3LsJeHR
	 dengYsB13y2LYhXih1A8n4iMEs96hQGBYUNFeY5zWLgEZ+sDauTadTyJeUlv+GRMPH
	 E+y7bAvDRhR8r86qpeu0waWpNj0UBHG+yqrda4fnPalscbSyzhi883TpG2Jf11pINp
	 dNMRIOeXPEEFw==
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the driver-core tree
Date: Wed, 30 Apr 2025 20:34:39 +0200
Message-ID: <4984921.GXAFRqVoOG@rjwysocki.net>
In-Reply-To: <20250430174726.0322f461@canb.auug.org.au>
References: <20250430174726.0322f461@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 217.114.34.19
X-CLIENT-HOSTNAME: 217.114.34.19
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffueeitdfgvddtudegueejtdffteetgeefkeffvdeftddttdeuhfegfedvjefhnecukfhppedvudejrdduudegrdefgedrudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedruddugedrfeegrdduledphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhjfiesrhhjfiihshhotghkihdrnhgvthdpnhgspghrtghpthhtohepgedprhgtphhtthhopehgrhgvgheskhhrohgrhhdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=4 Fuz1=4 Fuz2=4

On Wednesday, April 30, 2025 9:47:26 AM CEST Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the pm tree as a different commit (but
> the same patch):
> 
>   142ba31d8b4a ("PM: wakeup: Do not expose 4 device wakeup source APIs")
> 
> This is commit
> 
>   150b374b9ff9 ("PM: wakeup: Define four low-level functions as static")
> 
> in the pm tree.

I'll drop this from the PM tree, but this technically is PM material.

Thanks!




