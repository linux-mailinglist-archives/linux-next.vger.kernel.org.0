Return-Path: <linux-next+bounces-4718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B726A9C2D70
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 14:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E838E1C20C4C
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 13:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C972E15250F;
	Sat,  9 Nov 2024 13:03:49 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C41BC3F;
	Sat,  9 Nov 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731157429; cv=none; b=SqBauxpL+KbicMLI0tv1w2z7LV/iDVlHDFLKy+Y6OCPdnRJIVZhSRg+euAOKkqxP4ejU6WoNVgaVV7SRVWL+fR7G8O61y+WacrrSPvw/2KzOoxdnQId+nhEuC+GvpoGpxvKFHJ7VWtV6oooc0ieN4dG1W14lUYDK+/kNSEHcJ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731157429; c=relaxed/simple;
	bh=jO5N3i3CG9hEie1MsjolgadaWnH+qgWUWzXZ1HjOsd4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=aM6ib8iGzEKMdlUltlfitrYIMy52OATTm2PgBwRaesJLpmfmm1aLyPI5ARQmfspbo9d7LdfbjGnUhQsQGYQx8UJFIbGDP1iydv7q5+Is6gFqTXVEDY6UwdA3j/PI6x/SdWsj+xyLmVwbLfSncbnrrjS7ukePv5JURJpFtHHbW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id B257E1A0BA6;
	Sat,  9 Nov 2024 11:09:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 2D4962002A;
	Sat,  9 Nov 2024 11:09:00 +0000 (UTC)
Date: Sat, 09 Nov 2024 06:09:03 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Alice Ryhl <aliceryhl@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com>
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home> <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com> <20241108153503.1db26d04@gandalf.local.home> <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com> <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com>
Message-ID: <7B5D1CF7-0DBD-4F19-8587-32516DCE233B@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2D4962002A
X-Rspamd-Server: rspamout01
X-Stat-Signature: 8r8wjb1scmn64yts5697g3bd77mqdy4f
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/rD5JNfnckoZCbtkThoNjASTI9EyZm2FY=
X-HE-Tag: 1731150540-523950
X-HE-Meta: U2FsdGVkX18ATPc0FaJrsH2xtWAJ5EcY3fAza4NgsHPRZkCjR7dfLm1ZXq2oRLlyMp0etPZBKwF/55Wf9OrKX1VCHtyFKmvjEEpEzz9U2A0D3QxRNlpPxEaVXkrJmX+hoKIsxkzaqdDkyWn9oICvKyujOoRD7kNPD8PrnRd3ancjTBtPb2P22EtH0+pxyHbDoicg4F9nJQU0buSrmH9cKzvjpXgaM8ep6Y/s4O3hH7QV7OE7SraLnzqS4LoX1zDmuQwBp2YEIxjBbD5w9+XmGy9/APeRD7wXFHSaNpD6z6AMnbaGbxBHmrGe4NmdwbNhQjb5tSi2KDsstqlz8eNqH/9Eek17Im2I72Iak7YRn9sOjETWK6DQFg==



On November 8, 2024 4:53:56 PM EST, Miguel Ojeda <miguel=2Eojeda=2Esandoni=
s@gmail=2Ecom> wrote:
>On Fri, Nov 8, 2024 at 10:05=E2=80=AFPM Miguel Ojeda
><miguel=2Eojeda=2Esandonis@gmail=2Ecom> wrote:
>>
>> Something like this should work I think:
>
>https://lore=2Ekernel=2Eorg/rust-for-linux/20241108215115=2E1398033-1-oje=
da@kernel=2Eorg/

Are you going to take this or do you want me to?

If you want me to take it, can you send it to linux-trace-kernel@vger=2Eke=
rnel=2Eorg?

Thanks,

-- Steve=20

>
>Cheers,
>Miguel

