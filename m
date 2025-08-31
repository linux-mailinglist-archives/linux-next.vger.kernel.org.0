Return-Path: <linux-next+bounces-8146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DDB3D420
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 17:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E324717AF0E
	for <lists+linux-next@lfdr.de>; Sun, 31 Aug 2025 15:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0C65464E;
	Sun, 31 Aug 2025 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="QpW1xMqW"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C9DF9C1;
	Sun, 31 Aug 2025 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756653727; cv=none; b=IeVHJof5puZF0o7+ggLh4IyV/9AY/qy0t0M+oXaOWCxS14nl9wOUdBMnpCdQZkv2FtXSQoMoey/zGw87F18DX3RCWXAO3NDMjZQtULbb+7asSyGqjeoUy+HoQpO1VLN49TUp4NnGTm80CSkVG+WYFhdgxjLOi4b9ktZA+B/VONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756653727; c=relaxed/simple;
	bh=7CZu1SkW1ALfUc8C4RXXcsMGt7+l+E0pqMwXPnhpecM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAuQCHoKKczX09bMwBv3BDSWi1ow4+WDmi++NG12nxw7jIhZ3mosXBoCqROVipE6Rw8TZ341TfWWsX9H3Mx7sko9IXNdFY2/Cz8bY5kDDYLAQMFUv175+myM028/5x5IHjIK/Z9y25FWbg6i16zy3o64mm3EUrLVU0FYUGQPEJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=QpW1xMqW; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1756653675; x=1757258475; i=spasswolf@web.de;
	bh=MkkfNilRY2dglTJVgZlabu4fC3gZWEdoyK0nPDVLygs=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QpW1xMqWZUjk58JFCoc9rvrd4UzhJSNUa528lUrh6h9qrss8T5NhlaD5GxfHdmUE
	 S2MLSi2lvjmEiN4HWaf9WlMF9ek7376toWxDkIiy8KvtgJondUEo7pLme7fylFeuf
	 V4LAIFwmgHoeynDHV7Hbk+Lg/INEpabPQhhsYRAL07FIjjm/CdSHdtCE2+nLbYZT2
	 gAnn4HldR1we42ZzlV8ukvPlSSk179uxsQ8rbwkhmCCKSETYKWaj2C1Wfj/SWjAEK
	 iSRp3HoHiMc3g4v06LmOUg8P6DS8WMbER1vIzKD2LIqoAqzuToj+Rn0q9JUO06qSU
	 TDhJ3hrqHztEUhvfeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mf3uS-1uI2XR0w70-00fvKZ; Sun, 31
 Aug 2025 17:21:15 +0200
Message-ID: <cc8225b1fbdde38867f41955f34b748bb9f4f898.camel@web.de>
Subject: Re: (Re)boot hangs and refcount errors on next-20250829
From: Bert Karwatzki <spasswolf@web.de>
To: seanjc@google.com
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org, Jakub Kicinski <kuba@kernel.org>, Peter Zijlstra
	 <peterz@infradead.org>, torvalds@linux-foundation.org, x86@kernel.org, 
	tglx@linutronix.de, bp@alien8.de, spasswolf@web.de
Date: Sun, 31 Aug 2025 17:21:13 +0200
In-Reply-To: <20250831141426.2786-1-spasswolf@web.de>
References: <20250831141426.2786-1-spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xRFyLUoaXG9yiSK3ahAh1FQokz4Bq1e7vQnShAxrWNiAP2CxhtR
 w02xcwxdWfycABr1VfoZX1kRk+rhFMSaxsUvwNH42W3PQPLCWhro+b4WsP74wVPdDTWrn6+
 xH7oI+VPUSRf07UATlNpL3U8FVSpqtN2aP+FqWE0tKwYN9FTUr13VfaoAmgb4gkQXx2UUdA
 PPIsvhFNiqCHfUndwKRrQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FGDtstfTmKc=;sjaFF8xMlsOt7+D8VnyF4H5Z8d9
 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

I've found the missing piece of the patch here:
https://lore.kernel.org/all/175664303766.1920.13212322629796216488.tip-bot2@tip-bot2/#t

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index fb63c13aa66f..125804fbb5cb 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1722,6 +1722,7 @@ int futex_mm_init(struct mm_struct *mm)
        RCU_INIT_POINTER(mm->futex_phash, NULL);
        mm->futex_phash_new = NULL;
        /* futex-ref */
+       mm->futex_ref = NULL;
        atomic_long_set(&mm->futex_atomic, 0);
        mm->futex_batches = get_state_synchronize_rcu();
        return 0;

This solves all the mentioned Problems!

Bert Karwatzki

