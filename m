Return-Path: <linux-next+bounces-4689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFD9C0F97
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C407F1C22902
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 20:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2536D2161E5;
	Thu,  7 Nov 2024 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHn6MfUh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84E188CC6;
	Thu,  7 Nov 2024 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731010793; cv=none; b=B5shV9bdFWO7pRSuXgP2t3Sl+76dgB7vvDj6eEExbsVHoXXsl0amh/MrhlAScxIF6bKUdNrVPBbsJhmCzLE+uxastqOdM3OgzxS9XbD/8HZHYgMzSonHAN0cuejD9xdwgANz9Nmom/eQHj88/F3b6RsxlPQXspwgmcAx086FNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731010793; c=relaxed/simple;
	bh=ngBseiahzfXiUeLPru5MIhPwEzyDtQw6zEHkBUIJQuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHX2QfIt6P/59sVHE3vrg+RJS5F9Ooda8MzbySyYvVPvZ33k5LiELkkKPzHvU+wpIPP2ocrDHSFjxqNkNnS8fctMyOpHaT+QK23aAPhjfQpSpDi+GeifD/t3/RuAzvVKnNit1buNTAKYVEad+3ekR5vKs/KvmhH+oWrEAxAdhVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHn6MfUh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460ad0440ddso7640141cf.3;
        Thu, 07 Nov 2024 12:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731010790; x=1731615590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jLZkHdf9dB2NShwpXweNqF/joMCTyele50Lvhl5KeY=;
        b=eHn6MfUhUd77d15/rg7UsgFoMAWFStev/YXJbFqWfdYmmju+rBheZ9ypwIEAU9tVq+
         y5Zl7p8aKZSSiTH9gqGtB8TDnFZ8c63+E+eS1M2B315X+CFdwZf9mqOCvOfA0cN55/IH
         jbpy5OwNqyIAjQsXgNqairUPAdOyYyxH/RWCvTyuOLc0jz81nTxwKQwssVdCvdaig4mW
         Mzj4ZU0DsbLuJu2JfES/qFF9yAGYE1w2tbHl17uSDeKcV5RwJs+DuKs6JyPJw8kSHwfw
         VpfEvANPZ1U2yH4JzrvYxQkcIDMPOissVKa6xkAxoHKN96+ElZzN/z0NRbqDaGne3wIn
         kZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010790; x=1731615590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jLZkHdf9dB2NShwpXweNqF/joMCTyele50Lvhl5KeY=;
        b=fKl85homC6lfMeprMtiVPVqgooVyM2wQm0biWVx9HPTaD006cuyu8oPzbnuj+6QQ3Y
         bOAuU93BoQHD8JonO5Qel4Xu+5VLKmq5zEdHBo+HtDFr+zmjacdl62tIqRVPs2Veh/Fa
         J1DpKYru3J6ksCQ8yS9u2WWzEeyeCGGyUOMtrL8YWVivgs3dFXRJKk8BTLGC2ctTVSWf
         xqzvvOytZb8GqNt5We/ZfhxmuvUzcHLgz3/AP0+IOU+DFH6ynfHj5hbo6uX0RLSFlza7
         QIjxqtmCo0IUpeA9ROqeeDBjMLfXkoUJMXJeWT1XWtZWxnfmvcNJh7nlW3ZTHTSvvloV
         iX/A==
X-Forwarded-Encrypted: i=1; AJvYcCVBqJn2jjOXLt0UIMr2kiWNzwEpXZSsjn5iOFaqdWtJUkthJR/uRBvxEaNyEPdRIheDGTr7Ewj3Xr/S@vger.kernel.org, AJvYcCXVXbmemCvQXthtW16fv4X5Rh98FZQdq0MmsqbgjXguVaKzEMsmZK9fjX3TP/XIn2kDaTP0TYJ7dFlF8e76JVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXPLmWPFGov4Cs6tukwqWKvDii9uEE8B0qXL0F2JMaD8eFy8j
	KEUkGtBe9v5kIjXuyxf9s3j392H2ox0fEllMIjKzjrs+N/utBC6M
X-Google-Smtp-Source: AGHT+IFSXbFGDfFTHny0NTqpRB1yVvVaYRIHsYcecILjhvQborUeU+AM5ks3X2iKcQDW7CLX7Mp+2w==
X-Received: by 2002:a05:622a:1a15:b0:461:2061:19a2 with SMTP id d75a77b69052e-46309374561mr4459601cf.29.1731010790268;
        Thu, 07 Nov 2024 12:19:50 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff46d293sm11671941cf.47.2024.11.07.12.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 12:19:49 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 116FA1200043;
	Thu,  7 Nov 2024 15:19:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 07 Nov 2024 15:19:49 -0500
X-ME-Sender: <xms:5CAtZ93NMDo-8ZDarcXO0fVe1PfAHKIelIiP9689A48zbykL3REXQg>
    <xme:5CAtZ0FRblUDcqICR0-6KwrSN-2oxOqL20PQfcG58chrpnpY1xH4zcjS2CxPxQ0pO
    tYV2uOjWG_BimBcBg>
X-ME-Received: <xmr:5CAtZ95WRborTlxa7PBFxts4Ps4bZSVnpeD198tjzH1XI_cybkQEvbQ5jEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdeggddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epvgiiuhhlihgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnh
    gvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhr
    qdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhighhuvg
    hlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopeht
    ghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeifihhllhhirghmshesrh
    gvughhrghtrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:5CAtZ63cHHnQGnAgYNh5lnMQLmNJzzmX_e5sxWwIQfgYUR3G2FWRDQ>
    <xmx:5CAtZwEoTTGtUrvbYXtnlUttx45v7RatMslDwEgXlOxA5PfFD6nYxQ>
    <xmx:5CAtZ7-KnY-S0KNzbSzAMUh5uCXscWGYFAp9c8Y_CM5aNPoVIq-icA>
    <xmx:5CAtZ9k-ba2HjHil2zzaIXeIxdHKgx0e6c8KYdvFS_3rYB9BOHrGQw>
    <xmx:5SAtZ0GFtyRYMZFNeaJluIG4qlFLmk7YLclvFm30UqvJ24waW-qc924L>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Nov 2024 15:19:48 -0500 (EST)
Date: Thu, 7 Nov 2024 12:19:47 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Eder Zulian <ezulian@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	tglx@linutronix.de, williams@redhat.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, jlelli@redhat.com, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	bigeasy@linutronix.de, sfr@canb.auug.org.au, hpa@zytor.com
Subject: Re: [PATCH v3 1/1] rust: helpers: Avoid raw_spin_lock initialization
 for PREEMPT_RT
Message-ID: <Zy0g45UrhtVM09i8@Boquns-Mac-mini.local>
References: <20241107163223.2092690-1-ezulian@redhat.com>
 <20241107163223.2092690-2-ezulian@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107163223.2092690-2-ezulian@redhat.com>

On Thu, Nov 07, 2024 at 05:32:23PM +0100, Eder Zulian wrote:
> When PREEMPT_RT=y, spin locks are mapped to rt_mutex types, so using
> spinlock_check() + __raw_spin_lock_init() to initialize spin locks is
> incorrect, and would cause build errors.
> 
> Introduce __spin_lock_init() to initialize a spin lock with lockdep
> rquired information for PREEMPT_RT builds, and use it in the Rust
> helper.
> 
> Fixes: d2d6422f8bd1 ("x86: Allow to enable PREEMPT_RT.")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409251238.vetlgXE9-lkp@intel.com/
> Signed-off-by: Eder Zulian <ezulian@redhat.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

For testing, I used the following command as a reproducer:

ARM64:

./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_SMP=y  rust_doctests_kernel --kconfig_add CONFIG_WERROR=y --kconfig_add CONFIG_EXPERT=y --kconfig_add CONFIG_PREEMPT_RT=y --kconfig_add CONFIG_PROVE_LOCKING=y

X86_64:

./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_SMP=y  rust_doctests_kernel --kconfig_add CONFIG_WERROR=y --kconfig_add CONFIG_EXPERT=y --kconfig_add CONFIG_PREEMPT_RT=y --kconfig_add CONFIG_PROVE_LOCKING=y

And I applied this onto the tip/locking/core, can confirm the build
errors are gone. So

Tested-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> V1 -> V2: Cleaned up style and addressed review comments
> V2 -> V3: Improved commit title and description and corrected the 'Fixed:'
> tag as per reviewer's suggestion
> 
>  include/linux/spinlock_rt.h | 15 +++++++--------
>  rust/helpers/spinlock.c     |  8 ++++++--
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
> index f9f14e135be7..f6499c37157d 100644
> --- a/include/linux/spinlock_rt.h
> +++ b/include/linux/spinlock_rt.h
> @@ -16,22 +16,21 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
>  }
>  #endif
>  
> -#define spin_lock_init(slock)					\
> +#define __spin_lock_init(slock, name, key, percpu)		\
>  do {								\
> -	static struct lock_class_key __key;			\
> -								\
>  	rt_mutex_base_init(&(slock)->lock);			\
> -	__rt_spin_lock_init(slock, #slock, &__key, false);	\
> +	__rt_spin_lock_init(slock, name, key, percpu);		\
>  } while (0)
>  
> -#define local_spin_lock_init(slock)				\
> +#define _spin_lock_init(slock, percpu)				\
>  do {								\
>  	static struct lock_class_key __key;			\
> -								\
> -	rt_mutex_base_init(&(slock)->lock);			\
> -	__rt_spin_lock_init(slock, #slock, &__key, true);	\
> +	__spin_lock_init(slock, #slock, &__key, percpu);	\
>  } while (0)
>  
> +#define spin_lock_init(slock)		_spin_lock_init(slock, false)
> +#define local_spin_lock_init(slock)	_spin_lock_init(slock, true)
> +
>  extern void rt_spin_lock(spinlock_t *lock) __acquires(lock);
>  extern void rt_spin_lock_nested(spinlock_t *lock, int subclass)	__acquires(lock);
>  extern void rt_spin_lock_nest_lock(spinlock_t *lock, struct lockdep_map *nest_lock) __acquires(lock);
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index b7b0945e8b3c..5971fdf6f755 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -6,10 +6,14 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
>  				  struct lock_class_key *key)
>  {
>  #ifdef CONFIG_DEBUG_SPINLOCK
> +# if defined(CONFIG_PREEMPT_RT)
> +	__spin_lock_init(lock, name, key, false);
> +# else /*!CONFIG_PREEMPT_RT */
>  	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> -#else
> +# endif /* CONFIG_PREEMPT_RT */
> +#else /* !CONFIG_DEBUG_SPINLOCK */
>  	spin_lock_init(lock);
> -#endif
> +#endif /* CONFIG_DEBUG_SPINLOCK */
>  }
>  
>  void rust_helper_spin_lock(spinlock_t *lock)
> -- 
> 2.47.0
> 

