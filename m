Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDEDF253D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 03:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732938AbfKGCVs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 21:21:48 -0500
Received: from ozlabs.org ([203.11.71.1]:34441 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbfKGCVs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 21:21:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477nGF3CQLz9sNx;
        Thu,  7 Nov 2019 13:21:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573093304;
        bh=KGNl6sUiCz4f+yJNbN2XaMijKNR2ypk6vEzvOfrtqMQ=;
        h=Date:From:To:Cc:Subject:From;
        b=G9fdjcSKx4DWr/EV29HespizrqyOlfqzl53rNWgqqPNU+nEYJUCk/zbHan5HJEmTh
         iC+O1Qfbi1V0s8t5BrTLS30/O4fktAhQiXyoo10aP36hbnaXom5m//e6smFK70Mypf
         Is0BNWg1dDpJQlh5HrACRYvBd1CHo+85iya5R2kWwSFWVKNPes79do5ZMyU1BubdVN
         ap7djsgKBXvsEUE622RcpeVE8snheM0WUxlabJnHpD7Wjjm+flspOJhiutGqq93tEN
         nt92pahtx+vD1hLAzyOzZWVytvDMtA9lokumE0d9GieKl9tvzYnU9WFjDI8Kst4pLx
         ZJ0v50fGrCDvg==
Date:   Thu, 7 Nov 2019 13:21:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>, Jan Kara <jack@suse.cz>
Subject: linux-next: manual merge of the tip tree with the ext4 tree
Message-ID: <20191107132138.67da101f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7FB1rBv5YwvXYeS4XeHDzfi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7FB1rBv5YwvXYeS4XeHDzfi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  fs/jbd2/transaction.c

between commit:

  ec8b6f600e49 ("jbd2: Factor out common parts of stopping and restarting a=
 handle")

from the ext4 tree and commit:

  5facae4f3549 ("locking/lockdep: Remove unused @nested argument from lock_=
release()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/jbd2/transaction.c
index c068912408dd,b25ebdcabfa3..000000000000
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@@ -690,49 -655,6 +690,49 @@@ error_out
  	return result;
  }
 =20
 +static void stop_this_handle(handle_t *handle)
 +{
 +	transaction_t *transaction =3D handle->h_transaction;
 +	journal_t *journal =3D transaction->t_journal;
 +	int revokes;
 +
 +	J_ASSERT(journal_current_handle() =3D=3D handle);
 +	J_ASSERT(atomic_read(&transaction->t_updates) > 0);
 +	current->journal_info =3D NULL;
 +	/*
 +	 * Subtract necessary revoke descriptor blocks from handle credits. We
 +	 * take care to account only for revoke descriptor blocks the
 +	 * transaction will really need as large sequences of transactions with
 +	 * small numbers of revokes are relatively common.
 +	 */
 +	revokes =3D handle->h_revoke_credits_requested - handle->h_revoke_credit=
s;
 +	if (revokes) {
 +		int t_revokes, revoke_descriptors;
 +		int rr_per_blk =3D journal->j_revoke_records_per_block;
 +
 +		WARN_ON_ONCE(DIV_ROUND_UP(revokes, rr_per_blk)
 +				> handle->h_total_credits);
 +		t_revokes =3D atomic_add_return(revokes,
 +				&transaction->t_outstanding_revokes);
 +		revoke_descriptors =3D
 +			DIV_ROUND_UP(t_revokes, rr_per_blk) -
 +			DIV_ROUND_UP(t_revokes - revokes, rr_per_blk);
 +		handle->h_total_credits -=3D revoke_descriptors;
 +	}
 +	atomic_sub(handle->h_total_credits,
 +		   &transaction->t_outstanding_credits);
 +	if (handle->h_rsv_handle)
 +		__jbd2_journal_unreserve_handle(handle->h_rsv_handle);
 +	if (atomic_dec_and_test(&transaction->t_updates))
 +		wake_up(&journal->j_wait_updates);
 +
- 	rwsem_release(&journal->j_trans_commit_map, 1, _THIS_IP_);
++	rwsem_release(&journal->j_trans_commit_map, _THIS_IP_);
 +	/*
 +	 * Scope of the GFP_NOFS context is over here and so we can restore the
 +	 * original alloc context.
 +	 */
 +	memalloc_nofs_restore(handle->saved_alloc_context);
 +}
 =20
  /**
   * int jbd2_journal_restart() - restart a handle .

--Sig_/7FB1rBv5YwvXYeS4XeHDzfi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Df7IACgkQAVBC80lX
0Gwjugf+Nfahq/rIgvCSmZpcym69cSviqg7+/+6/caumm/ZdG9DpkF75X/L/LzDX
cL8bEk0TGHBcePA+xEFSbWfYInurVNnc6lTM4SxPGg06TdiQO71lYumpBfAQCVCB
bX9eVMSfRHmCMjSa/7SnuERtBxUTZhEU4wxKrfi1cQbtmhUq/kvxyGvZb/tY2pCd
rz6Pv13ZU6GYXkFC1kV4VZ76AHXwfqKGaRPYJOK47kM68dw4PCpD6jflZBoHwbT0
/YTYBA+WA2Vj6Spayw6mFTbJ4Ek0DO6Y9kK4waTqzTl2Gv5JXZ4XNNKzMQ/KBv7i
5g5UcpT8olp7fqB8pyXSXeG1FS3fxg==
=uQtu
-----END PGP SIGNATURE-----

--Sig_/7FB1rBv5YwvXYeS4XeHDzfi--
