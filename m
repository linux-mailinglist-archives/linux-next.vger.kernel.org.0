Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B43C410C0DD
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 00:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfK0X5J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 18:57:09 -0500
Received: from ozlabs.org ([203.11.71.1]:54445 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfK0X5J (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 18:57:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Nd3k1f5mz9sS9;
        Thu, 28 Nov 2019 10:57:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574899026;
        bh=8vHlwIeNDOCLiPjkmtFIBg1G6fO7lEAElclmRFTWoEs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Mjr4Wc8tQOWdyZIA/AbdLRc7LSMGVZDQZiE5AUHls+RMBBysjgrbh0ioLOzh5pGWl
         IqeljenKowzmPNHA06SZpTvycGFKgaSsEgi5IUwKhT7oesR9eyon0dOQ0DKdQ6BqfO
         hbTUsA9INw0LfEtUz4BvggmRmjkzpFfqsbvlnewXnU1cZylck1VcO+YWxreqWEFomO
         OazgYnQ25y3xU3Lo7Ek7uYXIB0pgGifjDHjGhyBqwlhLU8DLiuL1dswIiUje7Gk1jF
         HzUBtURZxRhrfrvvd8ffg14T2j4ioWI/LyMlIUE411f9AcprnKLHPjQA/x9xXBuCU+
         i210UsTzrDqvg==
Date:   Thu, 28 Nov 2019 10:57:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>, Jan Kara <jack@suse.cz>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the tip tree with the ext4 tree
Message-ID: <20191128105705.5ca58991@canb.auug.org.au>
In-Reply-To: <20191107132138.67da101f@canb.auug.org.au>
References: <20191107132138.67da101f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r198sWxhy__aLhPiLGghQMz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r198sWxhy__aLhPiLGghQMz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 7 Nov 2019 13:21:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   fs/jbd2/transaction.c
>=20
> between commit:
>=20
>   ec8b6f600e49 ("jbd2: Factor out common parts of stopping and restarting=
 a handle")
>=20
> from the ext4 tree and commit:
>=20
>   5facae4f3549 ("locking/lockdep: Remove unused @nested argument from loc=
k_release()")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/jbd2/transaction.c
> index c068912408dd,b25ebdcabfa3..000000000000
> --- a/fs/jbd2/transaction.c
> +++ b/fs/jbd2/transaction.c
> @@@ -690,49 -655,6 +690,49 @@@ error_out
>   	return result;
>   }
>  =20
>  +static void stop_this_handle(handle_t *handle)
>  +{
>  +	transaction_t *transaction =3D handle->h_transaction;
>  +	journal_t *journal =3D transaction->t_journal;
>  +	int revokes;
>  +
>  +	J_ASSERT(journal_current_handle() =3D=3D handle);
>  +	J_ASSERT(atomic_read(&transaction->t_updates) > 0);
>  +	current->journal_info =3D NULL;
>  +	/*
>  +	 * Subtract necessary revoke descriptor blocks from handle credits. We
>  +	 * take care to account only for revoke descriptor blocks the
>  +	 * transaction will really need as large sequences of transactions with
>  +	 * small numbers of revokes are relatively common.
>  +	 */
>  +	revokes =3D handle->h_revoke_credits_requested - handle->h_revoke_cred=
its;
>  +	if (revokes) {
>  +		int t_revokes, revoke_descriptors;
>  +		int rr_per_blk =3D journal->j_revoke_records_per_block;
>  +
>  +		WARN_ON_ONCE(DIV_ROUND_UP(revokes, rr_per_blk)
>  +				> handle->h_total_credits);
>  +		t_revokes =3D atomic_add_return(revokes,
>  +				&transaction->t_outstanding_revokes);
>  +		revoke_descriptors =3D
>  +			DIV_ROUND_UP(t_revokes, rr_per_blk) -
>  +			DIV_ROUND_UP(t_revokes - revokes, rr_per_blk);
>  +		handle->h_total_credits -=3D revoke_descriptors;
>  +	}
>  +	atomic_sub(handle->h_total_credits,
>  +		   &transaction->t_outstanding_credits);
>  +	if (handle->h_rsv_handle)
>  +		__jbd2_journal_unreserve_handle(handle->h_rsv_handle);
>  +	if (atomic_dec_and_test(&transaction->t_updates))
>  +		wake_up(&journal->j_wait_updates);
>  +
> - 	rwsem_release(&journal->j_trans_commit_map, 1, _THIS_IP_);
> ++	rwsem_release(&journal->j_trans_commit_map, _THIS_IP_);
>  +	/*
>  +	 * Scope of the GFP_NOFS context is over here and so we can restore the
>  +	 * original alloc context.
>  +	 */
>  +	memalloc_nofs_restore(handle->saved_alloc_context);
>  +}
>  =20
>   /**
>    * int jbd2_journal_restart() - restart a handle .

This is now a conflict between the ext4 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/r198sWxhy__aLhPiLGghQMz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fDVEACgkQAVBC80lX
0GzhRgf+JYX4wDDhkhrQN+cOQuZVDLL8FO/tMzBqN/PvRYy/Brf/XDFDgOpWP+c4
oHL+gWVhKBWbYSdmElyWiHr5XdNfL36Nue9bA2Kzjo0K8kFnWzjaP1QSauGesbAF
roCCiUHUl77BEW6cFfaoUTubdf9M2OvAb3cUvBXYX34XCLKo36cexxkuwaLGsuLk
14Bw2FB/Wrg2+zJnn1UPBbg+lLKbpvctz2KpSuJep+UOWlNwjRpQ7yDVXaFjASGl
ffUa/tJqJXBcAvCsAIhlQsAob6o6D/CV5kSzGaKS0eGmFn/xRJ1mgV3WQUW41zOB
4SZH3QYhiP00IWZgPnMLIM1ulnHeRw==
=HoFn
-----END PGP SIGNATURE-----

--Sig_/r198sWxhy__aLhPiLGghQMz--
