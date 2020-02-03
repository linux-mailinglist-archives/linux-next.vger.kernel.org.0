Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0A92150161
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2020 06:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgBCFZ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Feb 2020 00:25:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:52614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727359AbgBCFZ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Feb 2020 00:25:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3B1820721;
        Mon,  3 Feb 2020 05:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580707527;
        bh=Rd3RhW0hSxFREy89fO4D4ydx9QneiWEzojuwg5w5N8k=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=vAPn08+2XaSPg+4Yrad1JUEV6EXEwdnr6LSReS4Bg5eZ8MyU10EVbxABKX8idGKm+
         fnGkogil8dfT0E3I5/HOUix+R5GILQcH7qMbRWx/a1sbW49iXDrx6z3jUIRDNTJoPT
         vez45+OlLMOEkoZAau4LoEF3R0W5ETIcggjfxpf0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200203091633.3265a3f1@canb.auug.org.au>
References: <20200203091633.3265a3f1@canb.auug.org.au>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: linux-next: build warnings after merge of the clk tree
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wen He <wen.he_1@nxp.com>
User-Agent: alot/0.8.1
Date:   Sun, 02 Feb 2020 21:25:27 -0800
Message-Id: <20200203052527.B3B1820721@mail.kernel.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-02-02 14:16:33)
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:

Thanks. I missed this and I've sent a fix now.
