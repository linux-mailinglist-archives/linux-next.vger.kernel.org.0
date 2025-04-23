Return-Path: <linux-next+bounces-6359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC3A98C20
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 15:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14A823A5C6C
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8598D2367A0;
	Wed, 23 Apr 2025 13:59:24 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F558F40;
	Wed, 23 Apr 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416764; cv=none; b=Rhfme/5Tv9iGQ03xNqEZX5wZB9G86xju5ngjljgGQG2nLgfKX9Jr5dvW8Vv9k4+rxMoPI7YYF2rCkEGCy3JYUFCCqEnhFaJAAwFzlMkt0AcwOteZOtjwQWeLGgJUbOCvl0HDgtxOsqqryBHkWSx+5hyEXGLXiJ4Ac2vBe1V6TB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416764; c=relaxed/simple;
	bh=NIsvHkb3YAHcStXHbWWTCowsMopNVZxMx4x+Yl26gZk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ltk+Vdj/k8w+xmd61nd8bfu9sgD03uHACHwE/DBT9jOT43bH0GMs/6xrpEm/p12OjRTzEM0DDAeURa274boj8+GSfEUys612imp+Lm48X56CJiAY1NSeidjcsOH9NSr+GzVjGLgWQrALBjS2/nlnITQpbB7+1HQfAjZtDSgOiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1432C4CEE3;
	Wed, 23 Apr 2025 13:59:22 +0000 (UTC)
Date: Wed, 23 Apr 2025 10:01:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>, "Paul E . McKenney"
 <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr
 Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <20250423100115.657c68be@gandalf.local.home>
In-Reply-To: <8f7671cc-32f1-4028-a1b0-c7dccf472f76@amd.com>
References: <20250423115409.3425-1-spasswolf@web.de>
	<647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
	<20250423094655.2a0e25e0@gandalf.local.home>
	<8f7671cc-32f1-4028-a1b0-c7dccf472f76@amd.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 19:17:43 +0530
"Aithal, Srikanth" <sraithal@amd.com> wrote:

> On todays linux-next build the commit id is 
> c8943bdecfc76711f83241e21da9d4530f872f0d.

Which is why you should always state the subject of the commit and not only
use the sha of the commit.

Thanks,

-- Steve

