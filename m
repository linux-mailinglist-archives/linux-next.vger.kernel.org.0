Return-Path: <linux-next+bounces-9170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D43C7F3C3
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 08:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603CF3A5822
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 07:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7494086A;
	Mon, 24 Nov 2025 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j9uXMS11";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CE+D/T9V"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA536D4E6;
	Mon, 24 Nov 2025 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970333; cv=none; b=Swb8zMUaOBa+wnSDy5w8unIJjC06mz3rqPYg7viLdKAXoJ4NWniwbzKbDBUikJYZXIzcDGsfRZ9RDZd3z4+HI9fMKkR1jdRj52ji3zbisxjU9OXeOSlVozikBdztwORrYEzHewOg3XLAMGSky/1qj4HjuuvS30wyf+XNCgRLl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970333; c=relaxed/simple;
	bh=xOr5L6VEesmsQRESRBn79SwacI8aAHVPk6PoG7sJR0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7dq8kcWOeenf8H0gBy/no1CQuBRikqQUxHdjl3OFR38HBWJ9beAg5YUktTkiVgna678ah8SbuB5HyWwNoC8S7wHfKFcrkjGUhRfkQKHnEKAXp2dpXhW/enJIl1cKXbX3reS3Rq+jc+7DJumQkG7GBXrR7rO3LenMQtkyVkE7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j9uXMS11; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CE+D/T9V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 24 Nov 2025 08:45:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763970329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xOr5L6VEesmsQRESRBn79SwacI8aAHVPk6PoG7sJR0k=;
	b=j9uXMS11BlbbTyHHE9Dd/RHW6VNxOUpo8tEDB+zitmN6NT1ZY9LGQTKBSIEEGQrE6Cq3qg
	K1CNXq1I1qGdCcV9fFLAf78G1rPkvbqTuGVCzlvGaKx6xDmibyb3pvI5PB9R2L3vwjz6eq
	NcKCx/Mn0w4OPHEbLaSHCk38zQdBhGo1+ZzPFjNvMwbEE6Rv5gRw+8cW2mghF9IzBVPlc0
	loDSYdc/PQAsoxac8I/3EDxV6ir27pmLt2bXmfTrtyaFApN94pjD4CtxpVU4LOXiSv/QKR
	8x5YevpChb5F3LDhXfWwgItHCbBhwmYgbOBhH/uJuMROr85cEo5S0tZy1eCsqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763970329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xOr5L6VEesmsQRESRBn79SwacI8aAHVPk6PoG7sJR0k=;
	b=CE+D/T9VZfTlntLXOHNxOaMplNKZmEifNQEfR9BTZuzJct7SxCi6XEX8CgDUWalhW9i2IQ
	YIYPi4D821tepMCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Waiman Long <llong@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: linux-next: boot warning from the final tree
Message-ID: <20251124074528.qgPObFb-@linutronix.de>
References: <20251117202214.4f710f02@canb.auug.org.au>
 <20251121215819.GA1374726@ax162>
 <aSDoquGlA55Ge100@tardis.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSDoquGlA55Ge100@tardis.local>

On 2025-11-21 14:33:14 [-0800], Boqun Feng wrote:
> Thank you both, seems we missed the case where LOCKDEP=n but
> DEBUG_MUTEXES=y, I feel like the following should be the correct fix.

Thank you.

> Regards,
> Boqun

Sebastian

