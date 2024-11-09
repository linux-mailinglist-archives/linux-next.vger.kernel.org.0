Return-Path: <linux-next+bounces-4719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EC9C2D72
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 14:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D501C20D4B
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 13:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418B8195962;
	Sat,  9 Nov 2024 13:03:54 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBA1953B9;
	Sat,  9 Nov 2024 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731157434; cv=none; b=PYcnAPNLcZJbNYO4V3wr4I9fiEcsOOSs5i/5GIl6Cqfz753cwg126aUZbAcDjYsAyt8C5J0U8fnbSbu+A9QigZHlpA6yorrl2dyARG2jeyIr5++lajRpKJwgmutheWBReuKwX+oo6Cyg2d0napaAQX+CjdsttW5skct526kmTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731157434; c=relaxed/simple;
	bh=p21ZQk3STtW/QDeF+mZVHQPyJTR7lZ8r3bsVeoZagsQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gZbuNXMZxATzi/TX659HobLOxT/rD2eZoj3/W6Lx8WQyZAdtK/pfts8rUdlIdhnNT0gOb1IBBCRUscbAHwfDj0xezEI8+Z9xin7v49zzshVFL8HJcVLhJI8TQH8lGjoT0tOat9sI6iZmwsbYyE6E0y9m4Q8vg9Btp6S0PtR+IbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 0AD901A123F;
	Sat,  9 Nov 2024 13:03:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id AE36F20037;
	Sat,  9 Nov 2024 13:03:37 +0000 (UTC)
Date: Sat, 09 Nov 2024 08:03:38 -0500
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
In-Reply-To: <CANiq72kg2k6cn3J_x+DZVGgSKwVXF_bLHFYsuexPHHg6T7b7BQ@mail.gmail.com>
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home> <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com> <20241108153503.1db26d04@gandalf.local.home> <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com> <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com> <7B5D1CF7-0DBD-4F19-8587-32516DCE233B@goodmis.org> <CANiq72kg2k6cn3J_x+DZVGgSKwVXF_bLHFYsuexPHHg6T7b7BQ@mail.gmail.com>
Message-ID: <3DC15367-3B1B-4808-988D-8C8D1CB2F4BB@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AE36F20037
X-Rspamd-Server: rspamout05
X-Stat-Signature: 7w9p4d9j6mat95sp6wsxma53umybdgh8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19uJfctIkmZ147WBNgd15WfcASAQ+tU3KY=
X-HE-Tag: 1731157417-677159
X-HE-Meta: U2FsdGVkX1+Y5NrO2Nnvrqxvp5kAO6Wp4iLrsARADtihr0UhOde86s4b2od2qYdB8svvQR/msX9lcaXtEokoM7IQ1zVAXjGqynhcbgW8xn9N56X/xOITqPhOfA7VLG3cgySiJqzzXqhQJnWPykVT6Q2OsBEWsPrTnk5g19NudCC/64pzAO//99h2kVaXZl5r5ZgsNqWAsD1zXqS4q4hs/SzU7JyGPLqO+0EAnX58Y8a3ZLA4q0qXBfepLlUauaHnY8SAfEHkFWl5eA05VE3a/0K5BZTkB0Y0CNDPHJexovmzNSn4ey6Mao3jPZYH60JMD9kVtq4m483rZ0CTv7I8oL7OtUXDFuMJENG6f9VacTnUF0dG0btG0PuAp4XdrOaT5SeUE6riC3MwgFwZeO9Z5fnWXkjvkEVfagLRXEGbyMr1IplOiP9dNyoTrsvPY/OjUQamcd2XME0=



On November 9, 2024 6:55:25 AM EST, Miguel Ojeda <miguel=2Eojeda=2Esandoni=
s@gmail=2Ecom> wrote:
>On Sat, Nov 9, 2024 at 12:09=E2=80=AFPM Steven Rostedt <rostedt@goodmis=
=2Eorg> wrote:
>>
>> Are you going to take this or do you want me to?
>
>This requires the patch that it fixes, which you are carrying, so I
>can't take it, no? Or am I confused?
>

No, I'm currently traveling and thought your change just touched what's up=
stream=2E  I'll take it=2E

-- Steve=20

>> If you want me to take it, can you send it to linux-trace-kernel@vger=
=2Ekernel=2Eorg?
>
>Sure (assuming the above is correct)=2E
>
>Thanks!
>
>Cheers,
>Miguel

