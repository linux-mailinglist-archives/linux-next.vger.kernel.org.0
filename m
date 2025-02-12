Return-Path: <linux-next+bounces-5422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39AA31DF8
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 06:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F0D1884655
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 05:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF151F8AC5;
	Wed, 12 Feb 2025 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHzQPsuG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E851E7C2F;
	Wed, 12 Feb 2025 05:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739338469; cv=none; b=Useo33FMu4OyL2ogJO0G4SHQA0nh1+AI6kXCSltd5waluAjtX835wPSPeSfRTv2zDnuNob3paz+zJHQ28olODJlig6GkrlxAoa9T+EU0m/MV9Ahwl5Y2MjVIyR9I0xa5T4X2e+YyOCFIBucJhMWrghrLMXsywyyeX1gRYexO3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739338469; c=relaxed/simple;
	bh=vetvnqaMgMFfnTtJlr42Br7bp34acKqmyW5fLymmHK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNj9VZRjxa4F+zYvR7IqPfTp4JdenGJM0WtNFUlNpV8WclG5W1bpp6GVzCPKPP7ycA//UoytqwjCzpHQ9WSer3oOgb3y/++2lxvWzTbsglLlQacltUAluGQZMMJRyrJ089zR6X7723KgMBgHx7rlj8F5frOOk0RfH8hD6Ndno+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHzQPsuG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46fa764aac2so48933521cf.1;
        Tue, 11 Feb 2025 21:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739338467; x=1739943267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWvcsHjwUItsL+bsR+rRWGC8+PIcW1XZTc6Bg1dx9Pw=;
        b=bHzQPsuGTDGLuQrPgg9HFLqaUCoslpK3WdMkQb/LtvovFVEP3WCGNMGT19ct9Gs9cj
         0aejWrZsCIL8a3QIBwvXg3TpHv0c3EPauNl6UUp0b1/ZdILCV94UriVDVjoJNaTKiua5
         3MPviBW40l1sQNEhd5W0oQtl8dUcbTvu6NpeKorGCZAMpEMcaeIvzE6D945Ta1VbveK1
         6T4nSYULGlRS5z3uHp0b/rPRGUwoV3u90NHIWFRZzKynZz+FLkH9aeif2vO80YGRmmWN
         kaj844DgE9WrRHh0gV/WsWt0daPlJ4NA1teofj7n8JwIGXevLcgNSP+vlq7QOXJ42uqT
         lI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739338467; x=1739943267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWvcsHjwUItsL+bsR+rRWGC8+PIcW1XZTc6Bg1dx9Pw=;
        b=u5hIhKNidMZDldIblpPJCfk8F9kbH4ht6oLTtZHgqaba4iidcPsBiNn0gvHz3ei17W
         KNpAsCfXNR3fUJqLjDhqMFFYpk7bgB7hECW5SivIVovZ9zgCplo61jzNxCE9X3AFiG+J
         QUBHP4xNnOnnzbeP5VodAOH5BMkLgC5Pz9lrmuc11OYYUThumkZ9J+kLQd8xOoZQ1uyn
         2VZXL6wCxKBmck8H//R749bgbmhXjTk+i0j/9YrTzlESmVx2m61abcJFJrpt9RVgCt/q
         YOk+PhM+fyummDYdWlsfaYUjU19p0YfhXyhBGNHTIk51U2vEs3FEBCZa462RbPefujJW
         ApUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVda66MKVuqZyGtnCTLIYrvSicrCqF167Ei9Bn3TXk+ckA2ARLqRaFqz8J3HoG2vuiqRrKXxRbcUpKM9Q==@vger.kernel.org, AJvYcCW6BpjrIq//sOmohuhR89mUJGPn572Ga4YkbOIbkimYGoupOsU+XU7dD/eRRLqxEsv1zppH+fTDN0/+TCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS+5FEy0hyDq8RqfQr6G2NaZcHjiXlTYmlIrfK7vFr1ME0PzaU
	+QiUpMAdqZ7qWpqjC0A5khKvikoy0zFbDKYtJbdHqQVQTB2ZX2u2
X-Gm-Gg: ASbGncvRdq/xuGB5Q2cmDan4YXk2iF0dlEsQX0KLKRIPI0swT94cE7i714KtWK2xBI7
	QKQTqQvlf4qoEwWevBBHbLIhgLN+Pc7mS587O999bujzsMbTlw9GdZz++OQYORe6kle4zxGRpGz
	SsHw4xuardbkascVrhBissOK4I2yinWIZuFH2IoA9M7adOPtd2peK0xnigJSPX74l2ZPYUWV6FJ
	f1ZeFqV4Iqkmn4oiOWrkgT7y08quSFdgwjR7VLBgMvA8njKSPjvyKAU98wdVjv8mPCozFJX8DRe
	G/mcSt28SUQEN5NE7b+VVy2odIyr5DPIhEKOi5sWczL9hOAp9szCDX4+Q+Qm599wDSeNYn5e45D
	+e5llww==
X-Google-Smtp-Source: AGHT+IG3Uk4Lbac/eGi0GGCThi4fBJfbyMfJs/fZBNSbaaj6VzemeJD/xO8QHydWgaZ1whaG/QaPCw==
X-Received: by 2002:a05:622a:56:b0:471:a71c:eac1 with SMTP id d75a77b69052e-471afe3b82fmr27398781cf.21.1739338466758;
        Tue, 11 Feb 2025 21:34:26 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4719729977csm32862841cf.18.2025.02.11.21.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 21:34:26 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 792E51200078;
	Wed, 12 Feb 2025 00:34:25 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 12 Feb 2025 00:34:25 -0500
X-ME-Sender: <xms:4TKsZ7wEhyaSmWgMxJ2wnCkayQKtvxGIPO9uXVu8fc4BjkzCaMpXHQ>
    <xme:4TKsZzQIBGPQdDUEVnsX0aKdCqXGmX57qvDH-garIn8R0TeqUZvD72-xC8YdHgDh1
    S0TkPmHYGSQGYYorw>
X-ME-Received: <xmr:4TKsZ1WOZmdNucyhuy6Cjq84SCUtlPyXTfoBDZtVihE4B8T9nx2ylaKcJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfedthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdet
    heduudejvdektdekfeegvddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepvhgsrggskhgr
    sehsuhhsvgdrtgiipdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    vggvrhgrjhdruhhprgguhhihrgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehurh
    gviihkihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhn
    rghmvg
X-ME-Proxy: <xmx:4TKsZ1hkylvNulBlo94l3YOZpt56lgfnGDMUhda55IzRYqe9bxdo0A>
    <xmx:4TKsZ9CNt_guKCO9gGDA2lbmDnEA3YEWMbZsxp3KL226m_C4vrMYEQ>
    <xmx:4TKsZ-LdNmwKSRWi5kD9uKXaozJoY7DWUhpjKZ1zoLtcGry8j9fdhQ>
    <xmx:4TKsZ8AWq1mSd7VLMR24f0EB54rAxM5JzRHU84BWpyeaspop34YS8Q>
    <xmx:4TKsZ5z8-WWj5fI-UDKzcUZIAL9TwZOPEkLWOak-vXdmyWzjfrfyyFEp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 00:34:24 -0500 (EST)
Date: Tue, 11 Feb 2025 21:34:23 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <Z6wy388KxXI2xpfA@Mac.home>
References: <20250212150941.5e4fa1c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212150941.5e4fa1c9@canb.auug.org.au>

Hi Stephen,

On Wed, Feb 12, 2025 at 03:09:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the slab tree got a conflict in:
> 
>   kernel/rcu/tiny.c
> 
> between commits:
> 
>   84ae91018af5 ("rcutorture: Include grace-period sequence numbers in failure/close-call")
>   2db7ab8c1086 ("rcutorture: Expand failure/close-call grace-period output")
>   7acc2d90151f ("rcutorture: Make cur_ops->format_gp_seqs take buffer length")
> 
> from the rcu tree and commit:
> 
>   b14ff274e8aa ("slab, rcu: move TINY_RCU variant of kvfree_rcu() to SLAB")
> 
> from the slab tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks for reporting this, the below resolution looks good to me, I also
created a branch recording this:

	git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git merge/rcu-vs-slab.2025.02.11a

Regards,
Boqun

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tiny.c
> index 8a52aca686a5,7a34a99d4664..000000000000
> --- a/kernel/rcu/tiny.c
> +++ b/kernel/rcu/tiny.c
> @@@ -246,31 -232,6 +232,20 @@@ bool poll_state_synchronize_rcu(unsigne
>   }
>   EXPORT_SYMBOL_GPL(poll_state_synchronize_rcu);
>   
> - #ifdef CONFIG_KASAN_GENERIC
> - void kvfree_call_rcu(struct rcu_head *head, void *ptr)
> - {
> - 	if (head)
> - 		kasan_record_aux_stack(ptr);
> - 
> - 	__kvfree_call_rcu(head, ptr);
> - }
> - EXPORT_SYMBOL_GPL(kvfree_call_rcu);
> - #endif
> - 
>  +#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
>  +unsigned long long rcutorture_gather_gp_seqs(void)
>  +{
>  +	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;
>  +}
>  +EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
>  +
>  +void rcutorture_format_gp_seqs(unsigned long long seqs, char *cp, size_t len)
>  +{
>  +	snprintf(cp, len, "g%04llx", seqs & 0xffffULL);
>  +}
>  +EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
>  +#endif
>  +
>   void __init rcu_init(void)
>   {
>   	open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);



