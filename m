Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B273053C0
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhA0G7I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 01:59:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232417AbhA0G64 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 01:58:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQZDv1R93z9sWH;
        Wed, 27 Jan 2021 17:58:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611730688;
        bh=+0EXlbnxe33vfwxduNfW4kUChG44mcOBLomq8fyDR4c=;
        h=Date:From:To:Cc:Subject:From;
        b=Mvdwjrzl2H60H4FiKIqoQxilqkXG6Nxarqycr0FpdFK2QJwjKgU5g0frhXKBA1Oz6
         pFCuJenyQ3s06SWkXSW5peuil3QwXTJPV2hT2FChpZr4imIT6WczA5FU5z2BurCJ9t
         zXZ4sSPbVJINtcfgsA3+CJ+mLk1ssqrRtA7VoeYkRkI6xy0OyyVmhPDppJVfOUcYEw
         tzpB+OKF0JFRm46a32Qror7zuKXLvGXccY03ff5TPRF3Ts/+2I3/iAZgZVx1xvQVdz
         hVnS47fMeaGnwnIZVsI1MUMVsLkkJwkP7dStG3yJ8qGrEjQTVLL+xup7G1sd7vT8Yq
         5NC98ipdDk77Q==
Date:   Wed, 27 Jan 2021 17:58:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Douglas Gilbert <dgilbert@interlog.com>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the block tree
Message-ID: <20210127175805.407b631b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wLXVysWM19QCZGFhLAonPqV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wLXVysWM19QCZGFhLAonPqV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/sg.c

between commit:

  8eeed0b554b9 ("block: remove unnecessary argument from blk_execute_rq_now=
ait")

from the block tree and vaious commits from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/sg.c
index 4383d93110f8,c5a34bb91335..000000000000
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@@ -437,73 -858,243 +858,242 @@@ sg_rq_state_chg(struct sg_request *srp
  	return 0;
  }
 =20
- static ssize_t
- sg_read(struct file *filp, char __user *buf, size_t count, loff_t * ppos)
+ /*
+  * All writes and submits converge on this function to launch the SCSI
+  * command/request (via blk_execute_rq_nowait). Returns a pointer to a
+  * sg_request object holding the request just issued or a negated errno
+  * value twisted by ERR_PTR.
+  */
+ static struct sg_request *
+ sg_common_write(struct sg_fd *sfp, struct sg_comm_wr_t *cwrp)
  {
- 	Sg_device *sdp;
- 	Sg_fd *sfp;
- 	Sg_request *srp;
- 	int req_pack_id =3D -1;
- 	sg_io_hdr_t *hp;
- 	struct sg_header *old_hdr;
- 	int retval;
+ 	bool at_head;
+ 	int res =3D 0;
+ 	int dxfr_len, dir, cmd_len;
+ 	int pack_id =3D SG_PACK_ID_WILDCARD;
+ 	u32 rq_flags;
+ 	struct sg_device *sdp =3D sfp->parentdp;
+ 	struct sg_request *srp;
+ 	struct sg_io_hdr *hi_p;
+=20
+ 	hi_p =3D cwrp->h3p;
+ 	dir =3D hi_p->dxfer_direction;
+ 	dxfr_len =3D hi_p->dxfer_len;
+ 	rq_flags =3D hi_p->flags;
+ 	pack_id =3D hi_p->pack_id;
+ 	if (dxfr_len >=3D SZ_256M)
+ 		return ERR_PTR(-EINVAL);
+=20
+ 	srp =3D sg_setup_req(sfp, dxfr_len, cwrp);
+ 	if (IS_ERR(srp))
+ 		return srp;
+ 	srp->rq_flags =3D rq_flags;
+ 	srp->pack_id =3D pack_id;
+=20
+ 	cmd_len =3D hi_p->cmd_len;
+ 	memcpy(&srp->s_hdr3, hi_p, sizeof(srp->s_hdr3));
+ 	srp->cmd_opcode =3D cwrp->cmnd[0];/* hold opcode of command for debug */
+ 	SG_LOG(4, sfp, "%s: opcode=3D0x%02x, cdb_sz=3D%d, pack_id=3D%d\n", __fun=
c__,
+ 	       (int)cwrp->cmnd[0], cmd_len, pack_id);
+=20
+ 	res =3D sg_start_req(srp, cwrp->cmnd, cmd_len, dir);
+ 	if (res < 0)		/* probably out of space --> -ENOMEM */
+ 		goto err_out;
+ 	if (unlikely(SG_IS_DETACHING(sdp))) {
+ 		res =3D -ENODEV;
+ 		goto err_out;
+ 	}
+ 	if (unlikely(test_bit(SG_FRQ_BLK_PUT_REQ, srp->frq_bm) || !srp->rq)) {
+ 		res =3D -EIDRM;	/* this failure unexpected but observed */
+ 		goto err_out;
+ 	}
+ 	if (xa_get_mark(&sfp->srp_arr, srp->rq_idx, SG_XA_RQ_FREE)) {
+ 		SG_LOG(1, sfp, "%s: ahhh, request erased!!!\n", __func__);
+ 		res =3D -ENODEV;
+ 		goto err_out;
+ 	}
+ 	srp->rq->timeout =3D cwrp->timeout;
+ 	kref_get(&sfp->f_ref); /* sg_rq_end_io() does kref_put(). */
+ 	res =3D sg_rq_state_chg(srp, SG_RS_BUSY, SG_RS_INFLIGHT, false,
+ 			      __func__);
+ 	if (res)
+ 		goto err_out;
+ 	srp->start_ns =3D ktime_get_boottime_ns();
+ 	srp->duration =3D 0;
+=20
+ 	if (srp->s_hdr3.interface_id =3D=3D '\0')
+ 		at_head =3D true; /* backward compatibility: v1+v2 interfaces */
+ 	else if (test_bit(SG_FFD_Q_AT_TAIL, sfp->ffd_bm))
+ 	/* cmd flags can override sfd setting */
+ 		at_head =3D !!(srp->rq_flags & SG_FLAG_Q_AT_HEAD);
+ 	else            /* this sfd is defaulting to head */
+ 		at_head =3D !(srp->rq_flags & SG_FLAG_Q_AT_TAIL);
+ 	if (!test_bit(SG_FRQ_SYNC_INVOC, srp->frq_bm))
+ 		atomic_inc(&sfp->submitted);
 -	blk_execute_rq_nowait(sdp->device->request_queue, sdp->disk,
 -			      srp->rq, at_head, sg_rq_end_io);
++	blk_execute_rq_nowait(sdp->disk, srp->rq, at_head, sg_rq_end_io);
+ 	return srp;
+ err_out:
+ 	sg_finish_scsi_blk_rq(srp);
+ 	sg_deact_request(sfp, srp);
+ 	return ERR_PTR(res);
+ }
 =20
- 	/*
- 	 * This could cause a response to be stranded. Close the associated
- 	 * file descriptor to free up any resources being held.
- 	 */
- 	retval =3D sg_check_file_access(filp, __func__);
- 	if (retval)
- 		return retval;
+ /*
+  * This function is called by wait_event_interruptible in sg_read() and
+  * sg_ctl_ioreceive(). wait_event_interruptible will return if this one
+  * returns true (or an event like a signal (e.g. control-C) occurs).
+  */
 =20
- 	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentd=
p)))
- 		return -ENXIO;
- 	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
- 				      "sg_read: count=3D%d\n", (int) count));
+ static inline bool
+ sg_get_ready_srp(struct sg_fd *sfp, struct sg_request **srpp, int pack_id)
+ {
+ 	struct sg_request *srp;
 =20
- 	if (sfp->force_packid)
- 		retval =3D get_sg_io_pack_id(&req_pack_id, buf, count);
- 	if (retval)
- 		return retval;
+ 	if (unlikely(SG_IS_DETACHING(sfp->parentdp))) {
+ 		*srpp =3D NULL;
+ 		return true;
+ 	}
+ 	srp =3D sg_find_srp_by_id(sfp, pack_id);
+ 	*srpp =3D srp;
+ 	return !!srp;
+ }
 =20
- 	srp =3D sg_get_rq_mark(sfp, req_pack_id);
- 	if (!srp) {		/* now wait on packet to arrive */
- 		if (atomic_read(&sdp->detaching))
- 			return -ENODEV;
- 		if (filp->f_flags & O_NONBLOCK)
- 			return -EAGAIN;
- 		retval =3D wait_event_interruptible(sfp->read_wait,
- 			(atomic_read(&sdp->detaching) ||
- 			(srp =3D sg_get_rq_mark(sfp, req_pack_id))));
- 		if (atomic_read(&sdp->detaching))
- 			return -ENODEV;
- 		if (retval)
- 			/* -ERESTARTSYS as signal hit process */
- 			return retval;
+ /*
+  * Returns number of bytes copied to user space provided sense buffer or
+  * negated errno value.
+  */
+ static int
+ sg_copy_sense(struct sg_request *srp)
+ {
+ 	int sb_len_ret =3D 0;
+ 	int scsi_stat;
+=20
+ 	/* If need be, copy the sense buffer to the user space */
+ 	scsi_stat =3D srp->rq_result & 0xff;
+ 	if ((scsi_stat & SAM_STAT_CHECK_CONDITION) ||
+ 	    (driver_byte(srp->rq_result) & DRIVER_SENSE)) {
+ 		int sb_len =3D min_t(int, SCSI_SENSE_BUFFERSIZE, srp->sense_len);
+ 		int mx_sb_len =3D srp->s_hdr3.mx_sb_len;
+ 		u8 *sbp =3D srp->sense_bp;
+ 		void __user *up =3D srp->s_hdr3.sbp;
+=20
+ 		srp->sense_bp =3D NULL;
+ 		if (up && mx_sb_len > 0 && sbp) {
+ 			sb_len =3D min_t(int, mx_sb_len, sb_len);
+ 			/* Additional sense length field */
+ 			sb_len_ret =3D 8 + (int)sbp[7];
+ 			sb_len_ret =3D min_t(int, sb_len_ret, sb_len);
+ 			if (copy_to_user(up, sbp, sb_len_ret))
+ 				sb_len_ret =3D -EFAULT;
+ 		} else {
+ 			sb_len_ret =3D 0;
+ 		}
+ 		mempool_free(sbp, sg_sense_pool);
  	}
- 	if (srp->header.interface_id !=3D '\0')
- 		return sg_new_read(sfp, buf, count, srp);
+ 	return sb_len_ret;
+ }
 =20
- 	hp =3D &srp->header;
- 	old_hdr =3D kzalloc(SZ_SG_HEADER, GFP_KERNEL);
- 	if (!old_hdr)
- 		return -ENOMEM;
+ static int
+ sg_rec_state_v3(struct sg_fd *sfp, struct sg_request *srp)
+ {
+ 	int sb_len_wr;
+ 	u32 rq_res =3D srp->rq_result;
+=20
+ 	sb_len_wr =3D sg_copy_sense(srp);
+ 	if (sb_len_wr < 0)
+ 		return sb_len_wr;
+ 	if (rq_res & SG_ML_RESULT_MSK)
+ 		srp->rq_info |=3D SG_INFO_CHECK;
+ 	if (unlikely(SG_IS_DETACHING(sfp->parentdp)))
+ 		srp->rq_info |=3D SG_INFO_DEVICE_DETACHING;
+ 	return 0;
+ }
+=20
+ static ssize_t
+ sg_receive_v3(struct sg_fd *sfp, struct sg_request *srp, size_t count,
+ 	      void __user *p)
+ {
+ 	int err, err2;
+ 	int rq_result =3D srp->rq_result;
+ 	struct sg_io_hdr hdr3;
+ 	struct sg_io_hdr *hp =3D &hdr3;
 =20
- 	old_hdr->reply_len =3D (int) hp->timeout;
- 	old_hdr->pack_len =3D old_hdr->reply_len; /* old, strange behaviour */
- 	old_hdr->pack_id =3D hp->pack_id;
- 	old_hdr->twelve_byte =3D
- 	    ((srp->data.cmd_opcode >=3D 0xc0) && (12 =3D=3D hp->cmd_len)) ? 1 : =
0;
- 	old_hdr->target_status =3D hp->masked_status;
- 	old_hdr->host_status =3D hp->host_status;
- 	old_hdr->driver_status =3D hp->driver_status;
- 	if ((CHECK_CONDITION & hp->masked_status) ||
- 	    (DRIVER_SENSE & hp->driver_status))
- 		memcpy(old_hdr->sense_buffer, srp->sense_b,
- 		       sizeof (old_hdr->sense_buffer));
- 	switch (hp->host_status) {
- 	/* This setup of 'result' is for backward compatibility and is best
- 	   ignored by the user who should use target, host + driver status */
+ 	if (in_compat_syscall()) {
+ 		if (count < sizeof(struct compat_sg_io_hdr)) {
+ 			err =3D -EINVAL;
+ 			goto err_out;
+ 		}
+ 	} else if (count < SZ_SG_IO_HDR) {
+ 		err =3D -EINVAL;
+ 		goto err_out;
+ 	}
+ 	SG_LOG(3, sfp, "%s: srp=3D0x%pK\n", __func__, srp);
+ 	err =3D sg_rec_state_v3(sfp, srp);
+ 	memset(hp, 0, sizeof(*hp));
+ 	memcpy(hp, &srp->s_hdr3, sizeof(srp->s_hdr3));
+ 	hp->sb_len_wr =3D srp->sense_len;
+ 	hp->info =3D srp->rq_info;
+ 	hp->resid =3D srp->in_resid;
+ 	hp->duration =3D srp->duration;
+ 	hp->status =3D rq_result & 0xff;
+ 	hp->masked_status =3D status_byte(rq_result);
+ 	hp->msg_status =3D msg_byte(rq_result);
+ 	hp->host_status =3D host_byte(rq_result);
+ 	hp->driver_status =3D driver_byte(rq_result);
+ 	err2 =3D put_sg_io_hdr(hp, p);
+ 	err =3D err ? err : err2;
+ 	err2 =3D sg_rq_state_chg(srp, atomic_read(&srp->rq_st), SG_RS_RCV_DONE,
+ 			       false, __func__);
+ 	if (err2)
+ 		err =3D err ? err : err2;
+ err_out:
+ 	sg_finish_scsi_blk_rq(srp);
+ 	sg_deact_request(sfp, srp);
+ 	return err;
+ }
+=20
+ /*
+  * Completes a v3 request/command. Called from sg_read {v2 or v3},
+  * ioctl(SG_IO) {for v3}, or from ioctl(SG_IORECEIVE) when its
+  * completing a v3 request/command.
+  */
+ static int
+ sg_read_v1v2(void __user *buf, int count, struct sg_fd *sfp,
+ 	     struct sg_request *srp)
+ {
+ 	int res =3D 0;
+ 	u32 rq_result =3D srp->rq_result;
+ 	struct sg_header *h2p;
+ 	struct sg_slice_hdr3 *sh3p;
+ 	struct sg_header a_v2hdr;
+=20
+ 	h2p =3D &a_v2hdr;
+ 	memset(h2p, 0, SZ_SG_HEADER);
+ 	sh3p =3D &srp->s_hdr3;
+ 	h2p->reply_len =3D (int)sh3p->timeout;
+ 	h2p->pack_len =3D h2p->reply_len; /* old, strange behaviour */
+ 	h2p->pack_id =3D sh3p->pack_id;
+ 	h2p->twelve_byte =3D (srp->cmd_opcode >=3D 0xc0 && sh3p->cmd_len =3D=3D =
12);
+ 	h2p->target_status =3D status_byte(rq_result);
+ 	h2p->host_status =3D host_byte(rq_result);
+ 	h2p->driver_status =3D driver_byte(rq_result);
+ 	if ((CHECK_CONDITION & status_byte(rq_result)) ||
+ 	    (DRIVER_SENSE & driver_byte(rq_result))) {
+ 		if (srp->sense_bp) {
+ 			u8 *sbp =3D srp->sense_bp;
+=20
+ 			srp->sense_bp =3D NULL;
+ 			memcpy(h2p->sense_buffer, sbp,
+ 			       sizeof(h2p->sense_buffer));
+ 			mempool_free(sbp, sg_sense_pool);
+ 		}
+ 	}
+ 	switch (host_byte(rq_result)) {
+ 	/*
+ 	 * This following setting of 'result' is for backward compatibility
+ 	 * and is best ignored by the user who should use target, host and
+ 	 * driver status.
+ 	 */
  	case DID_OK:
  	case DID_PASSTHROUGH:
  	case DID_SOFT_ERROR:

--Sig_/wLXVysWM19QCZGFhLAonPqV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARDv0ACgkQAVBC80lX
0GzNYAf/cqdfrFzSanY9ZnBxNoanmwGDn3RMaYdtaxb63xRzcCDXgsVJrQCufJkZ
7V7U9RY98yMowrRhcwbpMFMcOXh2GM+wgpbMx+EGi5HAWnzdgY4EnIJSsQyoHG4G
i21OZ8oqpRuzZ6c+HEBbXLhUkfc57sdUcAmPGIAL2zkIs3P19so85eEdF38XTDSm
3aaPQgyP4FzSoQFvGtWGFb/8UPuiF4/tWodfd+c7llhz61haFhkSK8apa+SnV0vm
KyBKTNsTy8av8P/moLX1heDjJxHcyvZvAcJHDX2/TARppfgs/lWIWQJdPY0ICBtO
If+LIpGpZFhzlx2JvjhuYwPDEIC+0A==
=cSa9
-----END PGP SIGNATURE-----

--Sig_/wLXVysWM19QCZGFhLAonPqV--
