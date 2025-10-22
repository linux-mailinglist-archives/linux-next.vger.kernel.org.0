Return-Path: <linux-next+bounces-8677-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16CBF9DCF
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 05:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8710B4F0184
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 03:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659672D24AB;
	Wed, 22 Oct 2025 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBKNWn4A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B8225B30E
	for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104564; cv=none; b=nMvk5E8nZO4kueOs5tF0y5pOsdPK/DsOqR9ztWQNZ2qek86SQGd2nI6AxnntjhdZAngLuQIXvsqXNbA63WWhBCqTayUBcblMXmHHbj+MXWP+44LuRckXR2WmByqyflSkdKfwTj9hWRobGG9HGcx42X0mmqcNwYQZPpaqDVKFGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104564; c=relaxed/simple;
	bh=5dEMTKIfOwngad8bI+KVayrLiShgINPCGXdFjEovC1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=US58pEuuaERTa8VywKqWq9bqPXOabO7mebAxiEGHfbGN36i87LWC2YeHQGKdP3S2/uU4ArELlXE/4s9S4vhGN/Gch+IYZAzYSTDw2iAIadAgwsDHiZzqf6AmG9TGIPfD4FknFRY8MMKGApho0hOMKieNjmEXusKWH1mCIwy0PeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBKNWn4A; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4e89ffd95b9so7615521cf.0
        for <linux-next@vger.kernel.org>; Tue, 21 Oct 2025 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761104560; x=1761709360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SJGuMQr365bI1J+psUMsjzP+a8qVxLMJH41vnrHjg7o=;
        b=kBKNWn4AIO8bgm3BrCuzo0hQFpkh89bFCIyaRWS4mXQEpAC7noIwiN7ATCj44HKx36
         PQpvw0G0Dgl9sZiZIzsgWlsJhwTfPX2MCNKfKV9zg/+wO6ZE2NzzBC+FIHJI96gKF/8a
         eWI4faMvjV1rRoJXucniJddQax4KrbeXd7ho2Zo5hbxSDm7DODNCVdKsvGUDqJzWSRcB
         /gTSL4mDsH2rUTKlQVB1gQWazHVxGW4lwo5OiGVaOiICVutuZSkVGqrHbxVuqIO09bK+
         WaoEjSJ71revuq3nBJnOpT0sCuE9nOQJV7GQ8vbIiE6tssO1jrq7MuUFt5bLPNuCDoS4
         hHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761104560; x=1761709360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJGuMQr365bI1J+psUMsjzP+a8qVxLMJH41vnrHjg7o=;
        b=lZMc1kC6mPwELDdwd1m9RyTMAWbNO266PtlxYN5H5cl6kHnoyP/d+5ifMudj96rC+r
         m+7LOyp8C4I21vCpQa4QrvlqLTFjJx0vHKMBx7g6+dbsF/CYKvppCwwkYY5vWlG7Lz/G
         Np7Oavjtl7/JX6GOxHkKdgcQajS3k4m6mk38yNvuSw1iGfQu6kiBkwLdJVLmp2dhAgvG
         FdxzRnInubzOgq2knvGM9LqdM/seQdKINeLpFzwNk4mrqmPHUAHqM3l9rDlLSRYIfKbh
         xZtd+aOQ7Pn2lK9my1sulyimJ3yKohmwTzmuMPuglEyTZeU2MsSkbjnUykSPvoiFGUlH
         CZWA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrYqP6u1hth5dqdsui3Dh4wasqvZ0A12OddxJEZY2Tr7DP3yAwJKNincJihWfhKeSwsMaSpQBt+SM@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8rVnhaCbmOWkO3dvfhiXLawzyZNG6Lwhgbv9DN9Rv3uKFtYZ
	vwbYzYiycxTmudgFr+zA+psS3Ximak7TNWfCkpRppZOIK13ch4kDtpwZ
X-Gm-Gg: ASbGncu2FND6AuggeqMXsRtFGxT2DOdp85c3PoyKNrh6IltgxujEmqOYZaAhMbILtin
	37kI+YM6bxa6LxBjbBVyAcMjyE1O/xl68XLDahLtndrcnXHUM0GpdnT6S1qHKxni2JLBdBYAoR9
	rTGO1Kiv+mr0hO8h7qn6W24JiTCAz4H9O5fs4dDFRsZK4B9VRa9PjW5JyuF842mhtUmkPVbWAb+
	BTrmDmplAhvjMdz6zLOFJ1+gZW61+brjLAwMXMXwti2sYe9C+QPWSkzc0tLmfKPeu1nqC1G+b9d
	wBbMCjtJcw9qfe/8x7XwfIIO3CVHOZUoo3bBMGCOjVI36dOVeUxWKMng+5lFia8R03tFdM/xVMq
	yjfWKWZ6Ihi8bVEOvr5+14i4iLoqXLonz2SKdMLr/iia/UpqYHfI4qgrA3oI59WQ0OpvETy86NG
	zhScAx0xpIlAnDflx4VCLuGuzukETwWzbDTIc8OmDBw6fMXjrPInIdGZpp9CgnbBuh4lMEubgEg
	C2m7WbujOy2lOM=
X-Google-Smtp-Source: AGHT+IHAHDqhswmuHSxLidHCb6p5/Sb+uIpxgMc78LsU29Gzg/ywZi3Pz/uTIePpOTnuBimWngpWjA==
X-Received: by 2002:ac8:7f50:0:b0:4e8:999b:70a9 with SMTP id d75a77b69052e-4e89d4123dfmr213439791cf.72.1761104560306;
        Tue, 21 Oct 2025 20:42:40 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf521c120sm80452916d6.20.2025.10.21.20.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:42:39 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4BB81F40067;
	Tue, 21 Oct 2025 23:42:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 21 Oct 2025 23:42:39 -0400
X-ME-Sender: <xms:r1L4aO5QuU6kJpY067CnYlWqcqvFmE97CXfTCzClaQLZDJiPplN1xA>
    <xme:r1L4aHKBuyeyPZ6A0M2ZBJUx2UPme7CBDBva17QsqijCi72pVsMtpzWNVXUVSC58y
    iSmCFpVVTz9qIBeGSRf8RFJkdkwU2dT7HIc7bPlOYZF91kVFqYv>
X-ME-Received: <xmr:r1L4aAR-mawUh6bAFq7nD9CpjZm8SEHegqKG4rAtF71A4vzecRkMCCaB7Fqw2InofeOa1tdiXp2d1w5cNxhZPiguzeFlLfzJP-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugedvheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegurg
    hnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehm
    mhgruhhrvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhr
    tghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinh
    hgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:r1L4aCoXFIUxhQtfFQp32XW5JUu2_liVczouQoBYXzSeDaa-A7VwjA>
    <xmx:r1L4aGbhYbCXEGXXlOYEbZgzeUlNtYD1FqG9snCkpJm-9f19J_Sh5w>
    <xmx:r1L4aFTrOSTxBO-8Uxr5_XqyD2gs6JKqwLSq5Uu3lPPWOa6pqE064A>
    <xmx:r1L4aMeRmkj3bEUnBn9jW2fzDOjL_210EsEsjGynwE1_n0UYYBbqJA>
    <xmx:r1L4aMnFrxF0cE9UEg_n0U0in5v_feXSpHtXqzDH9Q69-krVG2uNHnvx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Oct 2025 23:42:38 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Matthew Maurer <mmaurer@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	lossin@kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: debugfs: Implement Reader for Mutex<T> only when T is Unpin
Date: Tue, 21 Oct 2025 23:42:37 -0400
Message-ID: <20251022034237.70431-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aPhGo5WjbPM1Yu95@tardis-2.local>
References: <aPhGo5WjbPM1Yu95@tardis-2.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we are going to make `Mutex<T>` structurally pin the data (i.e.
`T`), therefore `.lock()` function only returns a `Guard` that can
dereference a mutable reference to `T` if only `T` is `Unpin`, therefore
restrict the impl `Reader` block of `Mutex<T>` to that.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/debugfs/traits.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs/traits.rs b/rust/kernel/debugfs/traits.rs
index ab009eb254b3..ba7ec5a900b8 100644
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@ -50,7 +50,7 @@ pub trait Reader {
     fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result;
 }
 
-impl<T: FromStr> Reader for Mutex<T> {
+impl<T: FromStr + Unpin> Reader for Mutex<T> {
     fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
         let mut buf = [0u8; 128];
         if reader.len() > buf.len() {
-- 
2.51.0


