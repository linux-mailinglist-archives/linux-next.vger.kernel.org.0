Return-Path: <linux-next+bounces-3732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AA974495
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 23:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 435441C25285
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 21:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17E81A7051;
	Tue, 10 Sep 2024 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="PNGBIXQm"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F5A1AAE2C;
	Tue, 10 Sep 2024 21:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002623; cv=none; b=P4h69BYDtOeDQtSsZNs4RJReuc7y7cT/nD5Rb2pOcQHSagz1GLmtmjpBaR38tD3kQ2IIyB0/OKF2uxSGxvKbzAq8G7kXwnR3k7YNY6NUIpusnfX7+7LYKFhxLIQ3hqG6w251shbV2RKaqdqY8zWXiuCE/JWxcm8uetDdqmRjHd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002623; c=relaxed/simple;
	bh=+Z0/tjc/jkM+RNWY8w7dsalQvykoR7afGhcZ6SwUawA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIs5WUqwOkSfF4+gr7u2xONYmEJ0b9SzweVzLiPdkvE9fmCbCjXhu3sG0D3Nz/P1t0Rbg/HsdmyDlsyyn4qSt4O9Crr//A2GeNE8aopZ0CZ7oZLhM9ojr9QtwpGwV4G5y4c+UO1SrvWumruVaPsDumJRLSI87vaetDKwfjqgtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=PNGBIXQm; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726002608; x=1726607408; i=spasswolf@web.de;
	bh=Ms5DrLqZ2VNDZmH9AmQ6MHdPZ4yJsE8dvXy8GLF3lZs=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PNGBIXQmS1O1QRgRRX8enpmp3qSrKJ+/7BMnlBnyt5e1Hw7364nf4ur66wkTxY2+
	 g3nzi8iXvORRK2rRojiO6WuU+NsVhL/KT2s1Ry64QEZt+O8rBSNu7zzsrsNHro6Uh
	 hD/MdP+t7r0dVoBXZc2xKmhrUxfvCcZE8yR80B4MakuqnRlVXx2X9aylA+Cj8RMVE
	 aNKkxsBzn1ztUhTEXnCyNQMSqCjG1oXyUYjPldDeLhN9iwSNBD1186DZRKCG/j2yL
	 8JbN4yeU6TSY10PIMq2uzUXazDqutykOahbe31uQXtq6qOt3+LKkCeHc3aOZB/JLw
	 tZI7f7vRRtzVAqZz5A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1sisG52VJd-0066XX; Tue, 10
 Sep 2024 23:10:08 +0200
Message-ID: <7d9df9c96529841caa9fbdfa37850bc36e5160fe.camel@web.de>
Subject: Re: commit de752774f38bb causes fatal error on boot
From: Bert Karwatzki <spasswolf@web.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Thomas
 Gleixner	 <tglx@linutronix.de>, "Darrick J . Wong" <djwong@kernel.org>,
 x86@kernel.org, 	chandanbabu@kernel.org, willy@infradead.org,
 spasswolf@web.de
Date: Tue, 10 Sep 2024 23:10:08 +0200
In-Reply-To: <20240910135658.GG4723@noisy.programming.kicks-ass.net>
References: <20240910111111.2591-1-spasswolf@web.de>
	 <20240910135658.GG4723@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.53.3-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ehf3vA/Y2XVtylLD4q+ZLCpiw1j9yTVTQuXwYtfi2CAkf4DkAFh
 7VYWUlRfNbU5WHeZo28mqdoZXoIzTSzeZEFWz0QW8ijuSma6597GosqweJ6xrhg/DEi7Z6q
 wDZHMQAdewtE4UykmE0ceXV0JPuoJgLz2SV0cwTSGi7hAZlck69gb4LUk9mC/grkC9UaNcB
 lIUVs5NmeDVqUX0+BC5cQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GBGXn1xQnWc=;pS1umjDTnGWwW4SL520lfe39RVS
 0Yh1CH5Vk26AObvGXm2Y3S4DqYzb3QGTob1L6WGxt/NTLF5sCaiO0pLljGQEUNoKheBmVoxnW
 DfcpL4xk8Cgnv05T6b613ZYKKusudRfoZYSvLqfwsUKO6nPlGRXw5CGzWWXRO+ybuCEOmU0WV
 2adc3zLcjAZFU3lnxhysIRk2JUwSxe/kNU6bYkg7Dw6Nv5nhipcoadYQYpt61LHzInBazeBZL
 kAnkq/1IivVkekSdq5SB2tIRVMajnKoUdnFX144kxpaIhphUfF1OUchDra0ojPXxWhDxwqpLJ
 EE+1tNUo5qOQk28wQhLmoi9pQnVvLtaNQOnWEtQDpzyBoyPJBnGFJ/qTc4JnSikV/xhdhttee
 4JhyCADvgJBL3JL2wlJ2T0CQqI0MUWl5Khp76dCz0Ckm6JkpKv7xeUbvDNGVNlDrz9Fs9506b
 gjkrw6pwNFpMOlI2nwecA+X4RwU5Nuguz2JnKFOe2D/pgPZgzn8Cg5ro2zlOfkcGz0fx50tYO
 3qOFpK4Qx4RkyUZ+I8hJqLCC0DxfoL+LYEVocIwOzsESRaCtb+r8hFGK0xcSVcqg0Dr+tPYDp
 V5rhtvygnY7cZ7YlHpLjWBa6o9Z6CrSIFqR75lE/ReDMsUUL2T7GZpkoc9HOTL9RNSLT/nc9f
 QnO/573AFk0MBnjts92shk43GDXSl4eM893CAQG8Qmgc8Wdr7fdJRsKJVn1NDVLUdtVJsvawc
 inFfogT79LQMoxRMySw09nq04uD2LoUd+0o6I/T2/U/3N5/UG+iWbf4pPHMAkXRf/ucsMInw5
 kkCwEnblju7E+I9v40ehil9Q==

Am Dienstag, dem 10.09.2024 um 15:56 +0200 schrieb Peter Zijlstra:
> On Tue, Sep 10, 2024 at 01:11:09PM +0200, Bert Karwatzki wrote:
> > When booting linux-next-20240910 on my MSI alpha 15 Laptop running deb=
ian sid (amd64),
> > I get dropped to a shell and get the folllowing error in dmesg. I bise=
cted this to
> > commit de752774f38bb ("jump_label: Fix static_key_slow_dec() yet again=
").
>
> I've just replaced that commit with the below -- which should be in
> tomorrows tree:
>
> ---
> commit 1d7f856c2ca449f04a22d876e36b464b7a9d28b6
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Mon Sep 9 12:50:09 2024 +0200
>
>     jump_label: Fix static_key_slow_dec() yet again
>
>     While commit 83ab38ef0a0b ("jump_label: Fix concurrency issues in
>     static_key_slow_dec()") fixed one problem, it created yet another,
>     notably the following is now possible:
>
>       slow_dec
>         if (try_dec) // dec_not_one-ish, false
>         // enabled =3D=3D 1
>                                     slow_inc
>                                       if (inc_not_disabled) // inc_not_z=
ero-ish
>                                       // enabled =3D=3D 2
>                                         return
>
>         guard((mutex)(&jump_label_mutex);
>         if (atomic_cmpxchg(1,0)=3D=3D1) // false, we're 2
>
>                                     slow_dec
>                                       if (try-dec) // dec_not_one, true
>                                       // enabled =3D=3D 1
>                                         return
>         else
>           try_dec() // dec_not_one, false
>           WARN
>
>     Use dec_and_test instead of cmpxchg(), like it was prior to
>     83ab38ef0a0b. Add a few WARNs for the paranoid.
>
>     Fixes: 83ab38ef0a0b ("jump_label: Fix concurrency issues in static_k=
ey_slow_dec()")
>     Reported-by: "Darrick J. Wong" <djwong@kernel.org>
>     Tested-by: Klara Modin <klarasmodin@gmail.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> diff --git a/kernel/jump_label.c b/kernel/jump_label.c
> index 6dc76b590703..93a822d3c468 100644
> --- a/kernel/jump_label.c
> +++ b/kernel/jump_label.c
> @@ -168,7 +168,7 @@ bool static_key_slow_inc_cpuslocked(struct static_ke=
y *key)
>  		jump_label_update(key);
>  		/*
>  		 * Ensure that when static_key_fast_inc_not_disabled() or
> -		 * static_key_slow_try_dec() observe the positive value,
> +		 * static_key_dec_not_one() observe the positive value,
>  		 * they must also observe all the text changes.
>  		 */
>  		atomic_set_release(&key->enabled, 1);
> @@ -250,7 +250,7 @@ void static_key_disable(struct static_key *key)
>  }
>  EXPORT_SYMBOL_GPL(static_key_disable);
>
> -static bool static_key_slow_try_dec(struct static_key *key)
> +static bool static_key_dec_not_one(struct static_key *key)
>  {
>  	int v;
>
> @@ -274,6 +274,14 @@ static bool static_key_slow_try_dec(struct static_k=
ey *key)
>  		 * enabled. This suggests an ordering problem on the user side.
>  		 */
>  		WARN_ON_ONCE(v < 0);
> +
> +		/*
> +		 * Warn about underflow, and lie about success in an attempt to
> +		 * not make things worse.
> +		 */
> +		if (WARN_ON_ONCE(v =3D=3D 0))
> +			return true;
> +
>  		if (v <=3D 1)
>  			return false;
>  	} while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v - 1)));
> @@ -284,15 +292,27 @@ static bool static_key_slow_try_dec(struct static_=
key *key)
>  static void __static_key_slow_dec_cpuslocked(struct static_key *key)
>  {
>  	lockdep_assert_cpus_held();
> +	int val;
>
> -	if (static_key_slow_try_dec(key))
> +	if (static_key_dec_not_one(key))
>  		return;
>
>  	guard(mutex)(&jump_label_mutex);
> -	if (atomic_cmpxchg(&key->enabled, 1, 0) =3D=3D 1)
> +	val =3D atomic_read(&key->enabled);
> +	/*
> +	 * It should be impossible to observe -1 with jump_label_mutex held,
> +	 * see static_key_slow_inc_cpuslocked().
> +	 */
> +	if (WARN_ON_ONCE(val =3D=3D -1))
> +		return;
> +	/*
> +	 * Cannot already be 0, something went sideways.
> +	 */
> +	if (WARN_ON_ONCE(val =3D=3D 0))
> +		return;
> +
> +	if (atomic_dec_and_test(&key->enabled))
>  		jump_label_update(key);
> -	else
> -		WARN_ON_ONCE(!static_key_slow_try_dec(key));
>  }
>
>  static void __static_key_slow_dec(struct static_key *key)
> @@ -329,7 +349,7 @@ void __static_key_slow_dec_deferred(struct static_ke=
y *key,
>  {
>  	STATIC_KEY_CHECK_USE(key);
>
> -	if (static_key_slow_try_dec(key))
> +	if (static_key_dec_not_one(key))
>  		return;
>
>  	schedule_delayed_work(work, timeout);

Just tested the new version, no error here.

Bert karwatzki

