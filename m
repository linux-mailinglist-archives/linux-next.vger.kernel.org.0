Return-Path: <linux-next+bounces-6360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D9A98C26
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00E71885E45
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 14:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA5125E450;
	Wed, 23 Apr 2025 14:01:07 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0525DD15;
	Wed, 23 Apr 2025 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416867; cv=none; b=lqck+TaamdSBwxZIGbgOX1vgFlzFMyHRvF4VLalqPZWWj4T6qQsEzcF7D25Zykl4hKku7iAWWEDcs61u87sf0gDefJLQBJF7KGB8uB+wPfTl/Uc0m1RfXUDgLtsKOnHYtWeeaLI54IPWC/ZArlmr9vqSZlmTopubdPQexq40H9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416867; c=relaxed/simple;
	bh=n5pvX38w2XH3jmyJc/4T51GiVPoZ4YjwhB1Cjy/LJeE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcJfBquwhdbM7L/BffG7xvXAev5MokRCqRGEjRV15StNiDCKV0VGWxrGdp0NMnS/MVmMN8mJ03rrrlfVBmWQiS1TBAgbgc3Vn1lGjiMC3hoS7uDXrR2MAWulP6fb4Puc3/H6xoWDJGAt7N4p+ocfI7xdkLdP2fhGHcvJ8guHeRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BFEC4CEE2;
	Wed, 23 Apr 2025 14:01:04 +0000 (UTC)
Date: Wed, 23 Apr 2025 10:02:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>, "Paul E . McKenney"
 <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr
 Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <20250423100256.0e3d0a38@gandalf.local.home>
In-Reply-To: <20250423100115.657c68be@gandalf.local.home>
References: <20250423115409.3425-1-spasswolf@web.de>
	<647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
	<20250423094655.2a0e25e0@gandalf.local.home>
	<8f7671cc-32f1-4028-a1b0-c7dccf472f76@amd.com>
	<20250423100115.657c68be@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 10:01:15 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Which is why you should always state the subject of the commit and not only
> use the sha of the commit.

To explain this better, when referencing a commit, the standard way to do
so is by saying commit dd4cf8c9e1f4 ("ratelimit: Force re-initialization
when rate-limiting re-enabled").

-- Steve

