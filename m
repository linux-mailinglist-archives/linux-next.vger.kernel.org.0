Return-Path: <linux-next+bounces-230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2415804E0C
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 10:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C83C28163D
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678423FB01;
	Tue,  5 Dec 2023 09:38:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AFA9A;
	Tue,  5 Dec 2023 01:38:30 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rARsp-0006NF-Vz; Tue, 05 Dec 2023 10:38:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rockchip tree
Date: Tue, 05 Dec 2023 10:38:27 +0100
Message-ID: <4824013.9PvXe5no7K@diego>
In-Reply-To: <20231205152619.0ee82148@canb.auug.org.au>
References: <20231205152619.0ee82148@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 5. Dezember 2023, 05:26:19 CET schrieb Stephen Rothwell:
> Hi all,
> 
> ommits
> 
>   d892a562110e ("ARM: dts: rockchip: Enable GPU for XPI-3128")
>   2cc98b5080f6 ("ARM: dts: rockchip: Add GPU node for RK3128")
>   5e806176a3a5 ("ARM: dts: rockchip: Add power-controller for RK3128")
> 
> are missing a Signed-off-by from their committer.

sorry about that, I've added the missing Signed-off-bys now

Heiko






