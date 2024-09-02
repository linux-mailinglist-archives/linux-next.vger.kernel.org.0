Return-Path: <linux-next+bounces-3532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ABC967F8A
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F53B21C44
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1300514EC7D;
	Mon,  2 Sep 2024 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnTPkrg6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC48414BF89;
	Mon,  2 Sep 2024 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258889; cv=none; b=Gs+ngMlhUQy/sd+WfC2s/z4xRLZm2ixWyT5OHc+2vF5AoLvPnQLQV36Vzn6+S6ZMniczLcyull+7nlP+jCI2rYJ01IPXe2V+sZN+cLeuRrUn0xthF4bPWL9LUEB963Ded2lwUqI2OeePSt4VofQ5ZlDxHFUfD/VW1p0NIScyvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258889; c=relaxed/simple;
	bh=wcMSQA8WYUWgFzonFB2YmfkNA42kGf0+xpcAvOyuy5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPYHaD+tKTm/sUV1V9HeqnWRD2KwfMiVjuWZB7bUmNuCWWdYhnKN6qGIyg6WooRVV0UpG44KCV7NwHlH8NvcPoiKiXkkVzlS+TjsQAvCWanrOegALEz2a4YYUYeNu0/B8nys8K9/I3hsxqFshOHisR8jtgQZod43TlwMUu1S2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnTPkrg6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d88ec20283so96309a91.0;
        Sun, 01 Sep 2024 23:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725258887; x=1725863687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcMSQA8WYUWgFzonFB2YmfkNA42kGf0+xpcAvOyuy5g=;
        b=HnTPkrg65F51aMhNtjBaKHk5vSn/NZrJeRRJPg4tq6vmlEq8B5nWF1v6olT4kk+vuq
         fjXBjQLZAp5AFZcBGwhr4q6v+rPM+GQLOAtrTWKewmJexLxvVb8bKOawOr9tOVMc17X7
         T1aPhf6JoZLSWFufk1I342w/GVzB8rh+8hoG/9599lSGsjUmhs0jbycmKWjJtsMXhFKa
         ixigAZ11YZ5SiXfXGwvwBZigM2/uqs9KKSW1Om3nw/AzCKOY37o7p4amy6e37mjsxuhe
         n5cNKhAUmDPXqb5JqVRFA+r6ahSMKUpe9zrefR4TVajC3hI7hmKXigwo9SO/NnVzpkyr
         LYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258887; x=1725863687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcMSQA8WYUWgFzonFB2YmfkNA42kGf0+xpcAvOyuy5g=;
        b=SJPLaM4dCNq3NxYsw8LYMN8CeI1YQslHFWDTaOcx0iZK7vrZrL4jXIH8ijDhCxWjc1
         isbe/qos0/uS2y3C4lljFE4TQ7d2KvFV0ooWejcFKWBKt/V/ygGJaohoEklC25flVcQv
         iVGgWjNC8dBPQP8DbdlVn+VNHHSfwlgQtwvq/d2c9U/6JzXockenYBX1ICxjt1NbJ/xw
         qmxkrD7QRP7vL/eRj62ud9ZsAMjBv0e0AuDaDz3O4d5VRuPs9w+xvWoS92PlI/zIwAG+
         v1d/vYhIFu1zaneEs6M3RbHtP6EIsil0cy1k/caYFEaRyQm4XOnYnEhYXq48tpcnESft
         V9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEBbq6JjmQ6/V5mY63Gd6d1Fxj8xQZsNM/UMVyaLRj3Ops1etYX6dwokcvqLSe7JDTIcl8tn8oGDialS4=@vger.kernel.org, AJvYcCVlZkEA8i+exdtxwADLpwk8VDtiFLdVDgoIc9H7vYCVsEGO7fnGPaqm4VMKcKCqpW8abJk8wvjmRIO+NQ==@vger.kernel.org, AJvYcCXNZxXuQ0ynDvRFKT7B3wBOEvSM3a26nUkGD3g72mCbJErkgx7y6q7Qjy6DP3XwkxRsNKcULfpO@vger.kernel.org
X-Gm-Message-State: AOJu0YwRC95Dv07gXna+9TnDmQNcJlp808ekg1IvX6vx5QRavLy5gEaE
	qw/kb5Z+b/9P27L9PLw2Evmrgdv7TxjxBkyAJuPg7oN9RPS1tfkt8KTyd++R6jBRqqu3QcGbMLH
	6qeqUoHnsHx0k+a27S0wwRtiUkLc=
X-Google-Smtp-Source: AGHT+IEqfuDZ9uEtkPlNh9MtLGzJ0leCUIZld5PJP6naeMajr6dbWqjfTJC0+C9b9016cntJuzrK2LgXbCCtPGebGHs=
X-Received: by 2002:a17:90b:33c6:b0:2d3:cab7:f1dd with SMTP id
 98e67ed59e1d1-2d86b741b9bmr5562107a91.1.1725258886837; Sun, 01 Sep 2024
 23:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160436.793f145d@canb.auug.org.au>
In-Reply-To: <20240902160436.793f145d@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Sep 2024 08:34:34 +0200
Message-ID: <CANiq72mztgxn1CnXVDa6z+SUpmsmiL9eANzhYaBGAJ6_qTpqbg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the net-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Miller <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 8:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good, thanks!

Cheers,
Miguel

