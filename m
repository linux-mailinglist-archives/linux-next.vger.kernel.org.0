Return-Path: <linux-next+bounces-4777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E519C7ACC
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 19:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A6AB3384D
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 18:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64902038B7;
	Wed, 13 Nov 2024 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEdMKSrZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A031531EA;
	Wed, 13 Nov 2024 18:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521165; cv=none; b=K2KqMMiI/Bj6nyf4K6Rjz8kCWAcpLdyYU3omPMi9yXmrOouwyItulRg2/W8GMmB9/C73KhnaeabBbVngLrOtfLQO+68tcDzh8B7s5ofl0v/SjqBk9ria46jX2iUS62IXBsABRihyzUQoakMlnFfl6i6uT9L3JFPn4H8vZNJLWII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521165; c=relaxed/simple;
	bh=JaqV1dr57LyYbXyZU6ILQL5E6HKv/dyFHKLDnZ3tWJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwe6flrQ4F7VJjQEoNF82KroWk9tylsikTgI6Q8q8QPUadeqy/JrAmL7ib1NgwUpsps37nZwQIFTA5uI1tqkbz6OKQQoKHqcGuxIQSQ1bqAlrl5l8jh4Ury0M9zASz8zHz5OowXuKDxMVriv4yxnMXg0Fq4rqDd/D9Bqlpt4xTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEdMKSrZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so261003a91.0;
        Wed, 13 Nov 2024 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731521164; x=1732125964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaqV1dr57LyYbXyZU6ILQL5E6HKv/dyFHKLDnZ3tWJQ=;
        b=NEdMKSrZBcSRdC2F6fJMgF5Gw/LdnuCdP1zItH15djwPMXFhPPtXbe+b1idIh9UBmM
         qeuchQzhwxMlNS5ejK8FQYHoaXYwzQiM/2eWYzH/fH8FjTGzdyD/5eDUCx++yPAnkWwb
         OmJIuw3VBCpIupup2TYM7MiLO04YRZu6lbYHFpedZA7lnBSnsh8PU6XJo4OU0JRusslx
         YHddMXhDa7QHEgynSwbp9Ehw4nKRo0Ek4+3ykns4YXj5CaS+40tIqiDcdFMQefZwsykL
         b8UiIxOJGK+yzwC9dow7VTNbRBmo+lSTKyc2LGPzoxsA8O7r+24I6hpiQJ0u7TJqOP7T
         cfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731521164; x=1732125964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaqV1dr57LyYbXyZU6ILQL5E6HKv/dyFHKLDnZ3tWJQ=;
        b=cMAJeQrvjnaw0GDdwBoh4RjyXS5rYO80yBqVyzVtC+ACPo0GY5LV6gxyWDZc2LSRrP
         eSG/PL0VQ2bPdAHxaeHPneIeFXiHUnUVYb+anjTuoAOLHh4bnn4VZkr3Vq9XTVSGHeEs
         qYj8ZEGzA6OVLOzAsc8OlkfMB9vvpm3/e54Yl0fHrbkbNeUZGMui0TpyNyIz/5F5xehd
         SwGs62wCgXmUXWnQEi6VvaNzPAhWlpUA50OB6Fr42UnVdT1bcqtUCn8knlB4r+l3PIjW
         aXXesqlMKWB3xk+2fUEe3YZoxE++PYpf/j26PT6TLYf1iZRn7i5OAg4smrkFo+rDlGIW
         sgpA==
X-Forwarded-Encrypted: i=1; AJvYcCWxbzbiQ8guzVELCCDxc6k28G4sHnvNrWI0TFJGvP9i7k+EIl/T5uGTrEDaa+A+YyfJb4ANry2HbILtmjE=@vger.kernel.org, AJvYcCWyBX4iZ0ynXPDOFNFQj6Gx4wh6UyQhZEwU8ifFXuJoAO6pFhwVvROs39mqjm/CanD5uq4BHRNKtG3nDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeEwLx0X1YY1h3Xo2DKAmgILTnGlGSdDriAg4yPGzB0bhUMon
	0+LNJw42od59VQCHKmGdC7cyclW7Vz7gfTYdLh13AlgeuMEn8TCpDATBiLFSzKonkX21N1OOQvN
	W2dQPGucVNdj9SAcLrj3SPsjR1tw=
X-Google-Smtp-Source: AGHT+IF2d0vxhvyyFYqiuZsgcfsFWHCBBrLnPWw9IgtkkbYk2Q7Z1Qe0qRNnceq1xzCbFbirWwKf/JpYFZtQNBE33zc=
X-Received: by 2002:a17:90b:1a8a:b0:2e2:a60f:289e with SMTP id
 98e67ed59e1d1-2e9b14884dcmr11774955a91.0.1731521163613; Wed, 13 Nov 2024
 10:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171334.7ac7a6a6@canb.auug.org.au>
In-Reply-To: <20241113171334.7ac7a6a6@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Nov 2024 19:05:51 +0100
Message-ID: <CANiq72n8+VF7MMmf8LJ2obsNjWFidhvw=+_2X2Nnio-VKs=ZQw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the ftrace tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 7:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> ++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons

Looks good to me (ideally they would be sorted, but it does not
matter) -- thanks!

Cheers,
Miguel

