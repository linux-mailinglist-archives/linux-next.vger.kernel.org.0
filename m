Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B4B2D93C9
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 09:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439079AbgLNIH4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 03:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439078AbgLNIH4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 03:07:56 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0C2C0613CF;
        Mon, 14 Dec 2020 00:07:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvYrr09wJz9sS8;
        Mon, 14 Dec 2020 19:07:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607933231;
        bh=nz25baQcuaCj/0Sa0TuuCoUWe/BMO3+UlR8usFByDfA=;
        h=Date:From:To:Cc:Subject:From;
        b=Xns/1E8ThgAIlD66UrXf3hFfHaZhsVs1DuKdddLhY+nPtWKWuiGMDIsNWznRsJrkD
         GSB2v81mZ3UfJbCyqhVC4v7zq124wEuoz0k3XVYOcpiumhBYaeh/lsmPso7Rsp3noQ
         K3kuOUlxM5Rz/CJCcV7ZASl+IH9Axmt3nNKqkOo0uvh2WJHY3h18Ox5kOAj0AD7Gp1
         ZlcSoqmmmxJrJQv3xXqKFJMC/oXXR7E+HW9OWaYvM3Rjhosp2++JEFgQdTPgBJ6RIo
         WwTlon/2EBrtyb7SVSv3JQdgE5meSFbF4LnHwnaVTuRm9nVt5ItCQakBWFIy31+ZcG
         A4Xi43dwyKAYA==
Date:   Mon, 14 Dec 2020 19:07:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rtc tree with the tip tree
Message-ID: <20201214190704.78b44f5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WlDvPyKDHO71U8oprlGIncd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WlDvPyKDHO71U8oprlGIncd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rtc tree got a conflict in:

  include/linux/rtc.h

between commit:

  33e62e832384 ("ntp, rtc: Move rtc_set_ntp_time() to ntp code")

from the tip tree and commit:

  fdcfd854333b ("rtc: rework rtc_register_device() resource management")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/rtc.h
index b829382de6c3,55e7beed066c..000000000000
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@@ -110,43 -110,14 +110,37 @@@ struct rtc_device=20
  	/* Some hardware can't support UIE mode */
  	int uie_unsupported;
 =20
 -	/* Number of nsec it takes to set the RTC clock. This influences when
 -	 * the set ops are called. An offset:
 -	 *   - of 0.5 s will call RTC set for wall clock time 10.0 s at 9.5 s
 -	 *   - of 1.5 s will call RTC set for wall clock time 10.0 s at 8.5 s
 -	 *   - of -0.5 s will call RTC set for wall clock time 10.0 s at 10.5 s
 +	/*
 +	 * This offset specifies the update timing of the RTC.
 +	 *
 +	 * tsched     t1 write(t2.tv_sec - 1sec))  t2 RTC increments seconds
 +	 *
 +	 * The offset defines how tsched is computed so that the write to
 +	 * the RTC (t2.tv_sec - 1sec) is correct versus the time required
 +	 * for the transport of the write and the time which the RTC needs
 +	 * to increment seconds the first time after the write (t2).
 +	 *
 +	 * For direct accessible RTCs tsched ~=3D t1 because the write time
 +	 * is negligible. For RTCs behind slow busses the transport time is
 +	 * significant and has to be taken into account.
 +	 *
 +	 * The time between the write (t1) and the first increment after
 +	 * the write (t2) is RTC specific. For a MC146818 RTC it's 500ms,
 +	 * for many others it's exactly 1 second. Consult the datasheet.
 +	 *
 +	 * The value of this offset is also used to calculate the to be
 +	 * written value (t2.tv_sec - 1sec) at tsched.
 +	 *
 +	 * The default value for this is NSEC_PER_SEC + 10 msec default
 +	 * transport time. The offset can be adjusted by drivers so the
 +	 * calculation for the to be written value at tsched becomes
 +	 * correct:
 +	 *
 +	 *	newval =3D tsched + set_offset_nsec - NSEC_PER_SEC
 +	 * and  (tsched + set_offset_nsec) % NSEC_PER_SEC =3D=3D 0
  	 */
 -	long set_offset_nsec;
 +	unsigned long set_offset_nsec;
 =20
- 	bool registered;
-=20
- 	/* Old ABI support */
- 	bool nvram_old_abi;
- 	struct bin_attribute *nvram;
-=20
  	time64_t range_min;
  	timeu64_t range_max;
  	time64_t start_secs;
@@@ -227,8 -199,41 +221,8 @@@ static inline bool is_leap_year(unsigne
  	return (!(year % 4) && (year % 100)) || !(year % 400);
  }
 =20
- #define rtc_register_device(device) \
- 	__rtc_register_device(THIS_MODULE, device)
 -/* Determine if we can call to driver to set the time. Drivers can only be
 - * called to set a second aligned time value, and the field set_offset_ns=
ec
 - * specifies how far away from the second aligned time to call the driver.
 - *
 - * This also computes 'to_set' which is the time we are trying to set, an=
d has
 - * a zero in tv_nsecs, such that:
 - *    to_set - set_delay_nsec =3D=3D now +/- FUZZ
 - *
 - */
 -static inline bool rtc_tv_nsec_ok(s64 set_offset_nsec,
 -				  struct timespec64 *to_set,
 -				  const struct timespec64 *now)
 -{
 -	/* Allowed error in tv_nsec, arbitarily set to 5 jiffies in ns. */
 -	const unsigned long TIME_SET_NSEC_FUZZ =3D TICK_NSEC * 5;
 -	struct timespec64 delay =3D {.tv_sec =3D 0,
 -				   .tv_nsec =3D set_offset_nsec};
 -
 -	*to_set =3D timespec64_add(*now, delay);
 -
 -	if (to_set->tv_nsec < TIME_SET_NSEC_FUZZ) {
 -		to_set->tv_nsec =3D 0;
 -		return true;
 -	}
 -
 -	if (to_set->tv_nsec > NSEC_PER_SEC - TIME_SET_NSEC_FUZZ) {
 -		to_set->tv_sec++;
 -		to_set->tv_nsec =3D 0;
 -		return true;
 -	}
 -	return false;
 -}
 -
+ #define devm_rtc_register_device(device) \
+ 	__devm_rtc_register_device(THIS_MODULE, device)
 =20
  #ifdef CONFIG_RTC_HCTOSYS_DEVICE
  extern int rtc_hctosys_ret;

--Sig_/WlDvPyKDHO71U8oprlGIncd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XHSgACgkQAVBC80lX
0GxTiQf/bkoBdkAD7IG0TBmSTM+LyED7VgYe8rx/+SATD75WVndBTrw7U8W+4ffj
w2ojS6Ulj19+AZo7wy98H+owL4+HTCVtSdRsgTYM5rWAXk+8JnMiZpWIwLjYHK19
cUiWkgjZ8ej/d8jWuuBDbNgVlw5rfwLs/xQB6akW3YPrJSqzRyDYGy77sermL+Fj
iEY6kBkpQ/lGT7Ro/zPnHj7TBMNmmnV+XulD44IxoBHKhEjn/5bkbtsb1MLWbBpo
drqHiCt9XbAPdQL8BiHmEDPN+o/gKq8a2mSMBETnkEudNZCKw0/HPlIxG89fxbMK
zaH3FFgm6ytAbjpyg6I08cb0fBofAw==
=oiy/
-----END PGP SIGNATURE-----

--Sig_/WlDvPyKDHO71U8oprlGIncd--
