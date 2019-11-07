Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA290F2699
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 05:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733039AbfKGEiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 23:38:18 -0500
Received: from ozlabs.org ([203.11.71.1]:54011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbfKGEiS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 23:38:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477rHc6rz4z9sTd;
        Thu,  7 Nov 2019 15:38:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573101487;
        bh=FrJq5MMxiS0Og0AJ9uPnj5+W11+Kxbtp231u8pRg65o=;
        h=Date:From:To:Cc:Subject:From;
        b=TTjTTbuVqCmAeyaOq4hf3CWOTni5HUuS5uISUC9sAEsyetKKvl4UTy2ixcCSeXoBR
         3tK3C2riRopdZkEUlGIhBVZzCJj47pMx4phmKPtlnKNt0QwLpro5f3tmIQoDqxnCYt
         AsyeZjJe/fklkSpAnB5FCR6j7Fcf+XLAgaEMVeD6rOhO6lxTyUcgRS2iQV7GsWAW6V
         2/G464fOqrtnvWTJ0pbsxV99tom2nAtyZUQMnIKRhNxZoZ+llD1EyWwSZkqQLV9+is
         4MBrdKDkq2pq8YpOtVnYVQBPYp56Ncq0ErvMcqrcxnqs8Mj1pbosDCLpQ9XcL43oKF
         uooFTdur9W28A==
Date:   Thu, 7 Nov 2019 15:37:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the y2038 tree with the scsi tree
Message-ID: <20191107153757.4999749b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vq/5jtsOIOy.U2Vfd=G1tVg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vq/5jtsOIOy.U2Vfd=G1tVg
Content-Type: multipart/mixed; boundary="MP_/DTU6=qRuDnQw7nhGY+1r/Al"

--MP_/DTU6=qRuDnQw7nhGY+1r/Al
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  drivers/scsi/sg.c

between commits:

  a16a47416d3f ("scsi: sg: sg_ioctl(): fix copyout handling")
  c35a5cfb4150 ("scsi: sg: sg_read(): simplify reading ->pack_id of userlan=
d sg_io_hdr_t")
  d9fc5617bcb6 ("scsi: sg: sg_new_write(): don't bother with access_ok")

from the scsi tree and commits:

  98aaaec4a150 ("compat_ioctl: reimplement SG_IO handling")
  fd6c3d5accea ("compat_ioctl: move SG_GET_REQUEST_TABLE handling")

from the y2038 tree.

I fixed it up (I used one side for some conflicts and the other for
others - see the final file attached) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--MP_/DTU6=qRuDnQw7nhGY+1r/Al
Content-Type: text/x-c++src
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=sg.c

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 *  History:
 *  Started: Aug 9 by Lawrence Foard (entropy@world.std.com),
 *           to allow user process control of SCSI devices.
 *  Development Sponsored by Killy Corp. NY NY
 *
 * Original driver (sg.c):
 *        Copyright (C) 1992 Lawrence Foard
 * Version 2 and 3 extensions to driver:
 *        Copyright (C) 1998 - 2014 Douglas Gilbert
 */

static int sg_version_num =3D 30536;	/* 2 digits for each component */
#define SG_VERSION_STR "3.5.36"

/*
 *  D. P. Gilbert (dgilbert@interlog.com), notes:
 *      - scsi logging is available via SCSI_LOG_TIMEOUT macros. First
 *        the kernel/module needs to be built with CONFIG_SCSI_LOGGING
 *        (otherwise the macros compile to empty statements).
 *
 */
#include <linux/module.h>

#include <linux/fs.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/string.h>
#include <linux/mm.h>
#include <linux/errno.h>
#include <linux/mtio.h>
#include <linux/ioctl.h>
#include <linux/slab.h>
#include <linux/fcntl.h>
#include <linux/init.h>
#include <linux/poll.h>
#include <linux/moduleparam.h>
#include <linux/cdev.h>
#include <linux/idr.h>
#include <linux/seq_file.h>
#include <linux/blkdev.h>
#include <linux/delay.h>
#include <linux/blktrace_api.h>
#include <linux/mutex.h>
#include <linux/atomic.h>
#include <linux/ratelimit.h>
#include <linux/uio.h>
#include <linux/cred.h> /* for sg_check_file_access() */

#include "scsi.h"
#include <scsi/scsi_dbg.h>
#include <scsi/scsi_host.h>
#include <scsi/scsi_driver.h>
#include <scsi/scsi_ioctl.h>
#include <scsi/sg.h>

#include "scsi_logging.h"

#ifdef CONFIG_SCSI_PROC_FS
#include <linux/proc_fs.h>
static char *sg_version_date =3D "20140603";

static int sg_proc_init(void);
#endif

#define SG_ALLOW_DIO_DEF 0

#define SG_MAX_DEVS 32768

/* SG_MAX_CDB_SIZE should be 260 (spc4r37 section 3.1.30) however the type
 * of sg_io_hdr::cmd_len can only represent 255. All SCSI commands greater
 * than 16 bytes are "variable length" whose length is a multiple of 4
 */
#define SG_MAX_CDB_SIZE 252

#define SG_DEFAULT_TIMEOUT mult_frac(SG_DEFAULT_TIMEOUT_USER, HZ, USER_HZ)

int sg_big_buff =3D SG_DEF_RESERVED_SIZE;
/* N.B. This variable is readable and writeable via
   /proc/scsi/sg/def_reserved_size . Each time sg_open() is called a buffer
   of this size (or less if there is not enough memory) will be reserved
   for use by this file descriptor. [Deprecated usage: this variable is also
   readable via /proc/sys/kernel/sg-big-buff if the sg driver is built into
   the kernel (i.e. it is not a module).] */
static int def_reserved_size =3D -1;	/* picks up init parameter */
static int sg_allow_dio =3D SG_ALLOW_DIO_DEF;

static int scatter_elem_sz =3D SG_SCATTER_SZ;
static int scatter_elem_sz_prev =3D SG_SCATTER_SZ;

#define SG_SECTOR_SZ 512

static int sg_add_device(struct device *, struct class_interface *);
static void sg_remove_device(struct device *, struct class_interface *);

static DEFINE_IDR(sg_index_idr);
static DEFINE_RWLOCK(sg_index_lock);	/* Also used to lock
							   file descriptor list for device */

static struct class_interface sg_interface =3D {
	.add_dev        =3D sg_add_device,
	.remove_dev     =3D sg_remove_device,
};

typedef struct sg_scatter_hold { /* holding area for scsi scatter gather in=
fo */
	unsigned short k_use_sg; /* Count of kernel scatter-gather pieces */
	unsigned sglist_len; /* size of malloc'd scatter-gather list ++ */
	unsigned bufflen;	/* Size of (aggregate) data buffer */
	struct page **pages;
	int page_order;
	char dio_in_use;	/* 0->indirect IO (or mmap), 1->dio */
	unsigned char cmd_opcode; /* first byte of command */
} Sg_scatter_hold;

struct sg_device;		/* forward declarations */
struct sg_fd;

typedef struct sg_request {	/* SG_MAX_QUEUE requests outstanding per file */
	struct list_head entry;	/* list entry */
	struct sg_fd *parentfp;	/* NULL -> not in use */
	Sg_scatter_hold data;	/* hold buffer, perhaps scatter list */
	sg_io_hdr_t header;	/* scsi command+info, see <scsi/sg.h> */
	unsigned char sense_b[SCSI_SENSE_BUFFERSIZE];
	char res_used;		/* 1 -> using reserve buffer, 0 -> not ... */
	char orphan;		/* 1 -> drop on sight, 0 -> normal */
	char sg_io_owned;	/* 1 -> packet belongs to SG_IO */
	/* done protected by rq_list_lock */
	char done;		/* 0->before bh, 1->before read, 2->read */
	struct request *rq;
	struct bio *bio;
	struct execute_work ew;
} Sg_request;

typedef struct sg_fd {		/* holds the state of a file descriptor */
	struct list_head sfd_siblings;  /* protected by device's sfd_lock */
	struct sg_device *parentdp;	/* owning device */
	wait_queue_head_t read_wait;	/* queue read until command done */
	rwlock_t rq_list_lock;	/* protect access to list in req_arr */
	struct mutex f_mutex;	/* protect against changes in this fd */
	int timeout;		/* defaults to SG_DEFAULT_TIMEOUT      */
	int timeout_user;	/* defaults to SG_DEFAULT_TIMEOUT_USER */
	Sg_scatter_hold reserve;	/* buffer held for this file descriptor */
	struct list_head rq_list; /* head of request list */
	struct fasync_struct *async_qp;	/* used by asynchronous notification */
	Sg_request req_arr[SG_MAX_QUEUE];	/* used as singly-linked list */
	char force_packid;	/* 1 -> pack_id input to read(), 0 -> ignored */
	char cmd_q;		/* 1 -> allow command queuing, 0 -> don't */
	unsigned char next_cmd_len; /* 0: automatic, >0: use on next write() */
	char keep_orphan;	/* 0 -> drop orphan (def), 1 -> keep for read() */
	char mmap_called;	/* 0 -> mmap() never called on this fd */
	char res_in_use;	/* 1 -> 'reserve' array in use */
	struct kref f_ref;
	struct execute_work ew;
} Sg_fd;

typedef struct sg_device { /* holds the state of each scsi generic device */
	struct scsi_device *device;
	wait_queue_head_t open_wait;    /* queue open() when O_EXCL present */
	struct mutex open_rel_lock;     /* held when in open() or release() */
	int sg_tablesize;	/* adapter's max scatter-gather table size */
	u32 index;		/* device index number */
	struct list_head sfds;
	rwlock_t sfd_lock;      /* protect access to sfd list */
	atomic_t detaching;     /* 0->device usable, 1->device detaching */
	bool exclude;		/* 1->open(O_EXCL) succeeded and is active */
	int open_cnt;		/* count of opens (perhaps < num(sfds) ) */
	char sgdebug;		/* 0->off, 1->sense, 9->dump dev, 10-> all devs */
	struct gendisk *disk;
	struct cdev * cdev;	/* char_dev [sysfs: /sys/cdev/major/sg<n>] */
	struct kref d_ref;
} Sg_device;

/* tasklet or soft irq callback */
static void sg_rq_end_io(struct request *rq, blk_status_t status);
static int sg_start_req(Sg_request *srp, unsigned char *cmd);
static int sg_finish_rem_req(Sg_request * srp);
static int sg_build_indirect(Sg_scatter_hold * schp, Sg_fd * sfp, int buff_=
size);
static ssize_t sg_new_read(Sg_fd * sfp, char __user *buf, size_t count,
			   Sg_request * srp);
static ssize_t sg_new_write(Sg_fd *sfp, struct file *file,
			const char __user *buf, size_t count, int blocking,
			int read_only, int sg_io_owned, Sg_request **o_srp);
static int sg_common_write(Sg_fd * sfp, Sg_request * srp,
			   unsigned char *cmnd, int timeout, int blocking);
static int sg_read_oxfer(Sg_request * srp, char __user *outp, int num_read_=
xfer);
static void sg_remove_scat(Sg_fd * sfp, Sg_scatter_hold * schp);
static void sg_build_reserve(Sg_fd * sfp, int req_size);
static void sg_link_reserve(Sg_fd * sfp, Sg_request * srp, int size);
static void sg_unlink_reserve(Sg_fd * sfp, Sg_request * srp);
static Sg_fd *sg_add_sfp(Sg_device * sdp);
static void sg_remove_sfp(struct kref *);
static Sg_request *sg_get_rq_mark(Sg_fd * sfp, int pack_id);
static Sg_request *sg_add_request(Sg_fd * sfp);
static int sg_remove_request(Sg_fd * sfp, Sg_request * srp);
static Sg_device *sg_get_dev(int dev);
static void sg_device_destroy(struct kref *kref);

#define SZ_SG_HEADER sizeof(struct sg_header)
#define SZ_SG_IO_HDR sizeof(sg_io_hdr_t)
#define SZ_SG_IOVEC sizeof(sg_iovec_t)
#define SZ_SG_REQ_INFO sizeof(sg_req_info_t)

#define sg_printk(prefix, sdp, fmt, a...) \
	sdev_prefix_printk(prefix, (sdp)->device,		\
			   (sdp)->disk->disk_name, fmt, ##a)

/*
 * The SCSI interfaces that use read() and write() as an asynchronous varia=
nt of
 * ioctl(..., SG_IO, ...) are fundamentally unsafe, since there are lots of=
 ways
 * to trigger read() and write() calls from various contexts with elevated
 * privileges. This can lead to kernel memory corruption (e.g. if these
 * interfaces are called through splice()) and privilege escalation inside
 * userspace (e.g. if a process with access to such a device passes a file
 * descriptor to a SUID binary as stdin/stdout/stderr).
 *
 * This function provides protection for the legacy API by restricting the
 * calling context.
 */
static int sg_check_file_access(struct file *filp, const char *caller)
{
	if (filp->f_cred !=3D current_real_cred()) {
		pr_err_once("%s: process %d (%s) changed security contexts after opening =
file descriptor, this is not allowed.\n",
			caller, task_tgid_vnr(current), current->comm);
		return -EPERM;
	}
	if (uaccess_kernel()) {
		pr_err_once("%s: process %d (%s) called from kernel context, this is not =
allowed.\n",
			caller, task_tgid_vnr(current), current->comm);
		return -EACCES;
	}
	return 0;
}

static int sg_allow_access(struct file *filp, unsigned char *cmd)
{
	struct sg_fd *sfp =3D filp->private_data;

	if (sfp->parentdp->device->type =3D=3D TYPE_SCANNER)
		return 0;

	return blk_verify_command(cmd, filp->f_mode);
}

static int
open_wait(Sg_device *sdp, int flags)
{
	int retval =3D 0;

	if (flags & O_EXCL) {
		while (sdp->open_cnt > 0) {
			mutex_unlock(&sdp->open_rel_lock);
			retval =3D wait_event_interruptible(sdp->open_wait,
					(atomic_read(&sdp->detaching) ||
					 !sdp->open_cnt));
			mutex_lock(&sdp->open_rel_lock);

			if (retval) /* -ERESTARTSYS */
				return retval;
			if (atomic_read(&sdp->detaching))
				return -ENODEV;
		}
	} else {
		while (sdp->exclude) {
			mutex_unlock(&sdp->open_rel_lock);
			retval =3D wait_event_interruptible(sdp->open_wait,
					(atomic_read(&sdp->detaching) ||
					 !sdp->exclude));
			mutex_lock(&sdp->open_rel_lock);

			if (retval) /* -ERESTARTSYS */
				return retval;
			if (atomic_read(&sdp->detaching))
				return -ENODEV;
		}
	}

	return retval;
}

/* Returns 0 on success, else a negated errno value */
static int
sg_open(struct inode *inode, struct file *filp)
{
	int dev =3D iminor(inode);
	int flags =3D filp->f_flags;
	struct request_queue *q;
	Sg_device *sdp;
	Sg_fd *sfp;
	int retval;

	nonseekable_open(inode, filp);
	if ((flags & O_EXCL) && (O_RDONLY =3D=3D (flags & O_ACCMODE)))
		return -EPERM; /* Can't lock it with read only access */
	sdp =3D sg_get_dev(dev);
	if (IS_ERR(sdp))
		return PTR_ERR(sdp);

	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_open: flags=3D0x%x\n", flags));

	/* This driver's module count bumped by fops_get in <linux/fs.h> */
	/* Prevent the device driver from vanishing while we sleep */
	retval =3D scsi_device_get(sdp->device);
	if (retval)
		goto sg_put;

	retval =3D scsi_autopm_get_device(sdp->device);
	if (retval)
		goto sdp_put;

	/* scsi_block_when_processing_errors() may block so bypass
	 * check if O_NONBLOCK. Permits SCSI commands to be issued
	 * during error recovery. Tread carefully. */
	if (!((flags & O_NONBLOCK) ||
	      scsi_block_when_processing_errors(sdp->device))) {
		retval =3D -ENXIO;
		/* we are in error recovery for this device */
		goto error_out;
	}

	mutex_lock(&sdp->open_rel_lock);
	if (flags & O_NONBLOCK) {
		if (flags & O_EXCL) {
			if (sdp->open_cnt > 0) {
				retval =3D -EBUSY;
				goto error_mutex_locked;
			}
		} else {
			if (sdp->exclude) {
				retval =3D -EBUSY;
				goto error_mutex_locked;
			}
		}
	} else {
		retval =3D open_wait(sdp, flags);
		if (retval) /* -ERESTARTSYS or -ENODEV */
			goto error_mutex_locked;
	}

	/* N.B. at this point we are holding the open_rel_lock */
	if (flags & O_EXCL)
		sdp->exclude =3D true;

	if (sdp->open_cnt < 1) {  /* no existing opens */
		sdp->sgdebug =3D 0;
		q =3D sdp->device->request_queue;
		sdp->sg_tablesize =3D queue_max_segments(q);
	}
	sfp =3D sg_add_sfp(sdp);
	if (IS_ERR(sfp)) {
		retval =3D PTR_ERR(sfp);
		goto out_undo;
	}

	filp->private_data =3D sfp;
	sdp->open_cnt++;
	mutex_unlock(&sdp->open_rel_lock);

	retval =3D 0;
sg_put:
	kref_put(&sdp->d_ref, sg_device_destroy);
	return retval;

out_undo:
	if (flags & O_EXCL) {
		sdp->exclude =3D false;   /* undo if error */
		wake_up_interruptible(&sdp->open_wait);
	}
error_mutex_locked:
	mutex_unlock(&sdp->open_rel_lock);
error_out:
	scsi_autopm_put_device(sdp->device);
sdp_put:
	scsi_device_put(sdp->device);
	goto sg_put;
}

/* Release resources associated with a successful sg_open()
 * Returns 0 on success, else a negated errno value */
static int
sg_release(struct inode *inode, struct file *filp)
{
	Sg_device *sdp;
	Sg_fd *sfp;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp, "sg_release\n"));

	mutex_lock(&sdp->open_rel_lock);
	scsi_autopm_put_device(sdp->device);
	kref_put(&sfp->f_ref, sg_remove_sfp);
	sdp->open_cnt--;

	/* possibly many open()s waiting on exlude clearing, start many;
	 * only open(O_EXCL)s wait on 0=3D=3Dopen_cnt so only start one */
	if (sdp->exclude) {
		sdp->exclude =3D false;
		wake_up_interruptible_all(&sdp->open_wait);
	} else if (0 =3D=3D sdp->open_cnt) {
		wake_up_interruptible(&sdp->open_wait);
	}
	mutex_unlock(&sdp->open_rel_lock);
	return 0;
}

static ssize_t
sg_read(struct file *filp, char __user *buf, size_t count, loff_t * ppos)
{
	Sg_device *sdp;
	Sg_fd *sfp;
	Sg_request *srp;
	int req_pack_id =3D -1;
	sg_io_hdr_t *hp;
	struct sg_header *old_hdr =3D NULL;
	int retval =3D 0;

	/*
	 * This could cause a response to be stranded. Close the associated
	 * file descriptor to free up any resources being held.
	 */
	retval =3D sg_check_file_access(filp, __func__);
	if (retval)
		return retval;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_read: count=3D%d\n", (int) count));

	if (sfp->force_packid && (count >=3D SZ_SG_HEADER)) {
		old_hdr =3D memdup_user(buf, SZ_SG_HEADER);
		if (IS_ERR(old_hdr))
			return PTR_ERR(old_hdr);
		if (old_hdr->reply_len < 0) {
			if (count >=3D SZ_SG_IO_HDR) {
				sg_io_hdr_t __user *p =3D (void __user *)buf;
				if (get_user(req_pack_id, &p->pack_id)) {
					retval =3D -EFAULT;
					goto free_old_hdr;
				}
			}
		} else
			req_pack_id =3D old_hdr->pack_id;
	}
	srp =3D sg_get_rq_mark(sfp, req_pack_id);
	if (!srp) {		/* now wait on packet to arrive */
		if (atomic_read(&sdp->detaching)) {
			retval =3D -ENODEV;
			goto free_old_hdr;
		}
		if (filp->f_flags & O_NONBLOCK) {
			retval =3D -EAGAIN;
			goto free_old_hdr;
		}
		retval =3D wait_event_interruptible(sfp->read_wait,
			(atomic_read(&sdp->detaching) ||
			(srp =3D sg_get_rq_mark(sfp, req_pack_id))));
		if (atomic_read(&sdp->detaching)) {
			retval =3D -ENODEV;
			goto free_old_hdr;
		}
		if (retval) {
			/* -ERESTARTSYS as signal hit process */
			goto free_old_hdr;
		}
	}
	if (srp->header.interface_id !=3D '\0') {
		retval =3D sg_new_read(sfp, buf, count, srp);
		goto free_old_hdr;
	}

	hp =3D &srp->header;
	if (old_hdr =3D=3D NULL) {
		old_hdr =3D kmalloc(SZ_SG_HEADER, GFP_KERNEL);
		if (! old_hdr) {
			retval =3D -ENOMEM;
			goto free_old_hdr;
		}
	}
	memset(old_hdr, 0, SZ_SG_HEADER);
	old_hdr->reply_len =3D (int) hp->timeout;
	old_hdr->pack_len =3D old_hdr->reply_len; /* old, strange behaviour */
	old_hdr->pack_id =3D hp->pack_id;
	old_hdr->twelve_byte =3D
	    ((srp->data.cmd_opcode >=3D 0xc0) && (12 =3D=3D hp->cmd_len)) ? 1 : 0;
	old_hdr->target_status =3D hp->masked_status;
	old_hdr->host_status =3D hp->host_status;
	old_hdr->driver_status =3D hp->driver_status;
	if ((CHECK_CONDITION & hp->masked_status) ||
	    (DRIVER_SENSE & hp->driver_status))
		memcpy(old_hdr->sense_buffer, srp->sense_b,
		       sizeof (old_hdr->sense_buffer));
	switch (hp->host_status) {
	/* This setup of 'result' is for backward compatibility and is best
	   ignored by the user who should use target, host + driver status */
	case DID_OK:
	case DID_PASSTHROUGH:
	case DID_SOFT_ERROR:
		old_hdr->result =3D 0;
		break;
	case DID_NO_CONNECT:
	case DID_BUS_BUSY:
	case DID_TIME_OUT:
		old_hdr->result =3D EBUSY;
		break;
	case DID_BAD_TARGET:
	case DID_ABORT:
	case DID_PARITY:
	case DID_RESET:
	case DID_BAD_INTR:
		old_hdr->result =3D EIO;
		break;
	case DID_ERROR:
		old_hdr->result =3D (srp->sense_b[0] =3D=3D 0 &&=20
				  hp->masked_status =3D=3D GOOD) ? 0 : EIO;
		break;
	default:
		old_hdr->result =3D EIO;
		break;
	}

	/* Now copy the result back to the user buffer.  */
	if (count >=3D SZ_SG_HEADER) {
		if (copy_to_user(buf, old_hdr, SZ_SG_HEADER)) {
			retval =3D -EFAULT;
			goto free_old_hdr;
		}
		buf +=3D SZ_SG_HEADER;
		if (count > old_hdr->reply_len)
			count =3D old_hdr->reply_len;
		if (count > SZ_SG_HEADER) {
			if (sg_read_oxfer(srp, buf, count - SZ_SG_HEADER)) {
				retval =3D -EFAULT;
				goto free_old_hdr;
			}
		}
	} else
		count =3D (old_hdr->result =3D=3D 0) ? 0 : -EIO;
	sg_finish_rem_req(srp);
	sg_remove_request(sfp, srp);
	retval =3D count;
free_old_hdr:
	kfree(old_hdr);
	return retval;
}

static ssize_t
sg_new_read(Sg_fd * sfp, char __user *buf, size_t count, Sg_request * srp)
{
	sg_io_hdr_t *hp =3D &srp->header;
	int err =3D 0, err2;
	int len;

	if (count < SZ_SG_IO_HDR) {
		err =3D -EINVAL;
		goto err_out;
	}
	hp->sb_len_wr =3D 0;
	if ((hp->mx_sb_len > 0) && hp->sbp) {
		if ((CHECK_CONDITION & hp->masked_status) ||
		    (DRIVER_SENSE & hp->driver_status)) {
			int sb_len =3D SCSI_SENSE_BUFFERSIZE;
			sb_len =3D (hp->mx_sb_len > sb_len) ? sb_len : hp->mx_sb_len;
			len =3D 8 + (int) srp->sense_b[7];	/* Additional sense length field */
			len =3D (len > sb_len) ? sb_len : len;
			if (copy_to_user(hp->sbp, srp->sense_b, len)) {
				err =3D -EFAULT;
				goto err_out;
			}
			hp->sb_len_wr =3D len;
		}
	}
	if (hp->masked_status || hp->host_status || hp->driver_status)
		hp->info |=3D SG_INFO_CHECK;
	err =3D put_sg_io_hdr(hp, buf);
err_out:
	err2 =3D sg_finish_rem_req(srp);
	sg_remove_request(sfp, srp);
	return err ? : err2 ? : count;
}

static ssize_t
sg_write(struct file *filp, const char __user *buf, size_t count, loff_t * =
ppos)
{
	int mxsize, cmd_size, k;
	int input_size, blocking;
	unsigned char opcode;
	Sg_device *sdp;
	Sg_fd *sfp;
	Sg_request *srp;
	struct sg_header old_hdr;
	sg_io_hdr_t *hp;
	unsigned char cmnd[SG_MAX_CDB_SIZE];
	int retval;

	retval =3D sg_check_file_access(filp, __func__);
	if (retval)
		return retval;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_write: count=3D%d\n", (int) count));
	if (atomic_read(&sdp->detaching))
		return -ENODEV;
	if (!((filp->f_flags & O_NONBLOCK) ||
	      scsi_block_when_processing_errors(sdp->device)))
		return -ENXIO;

	if (count < SZ_SG_HEADER)
		return -EIO;
	if (copy_from_user(&old_hdr, buf, SZ_SG_HEADER))
		return -EFAULT;
	blocking =3D !(filp->f_flags & O_NONBLOCK);
	if (old_hdr.reply_len < 0)
		return sg_new_write(sfp, filp, buf, count,
				    blocking, 0, 0, NULL);
	if (count < (SZ_SG_HEADER + 6))
		return -EIO;	/* The minimum scsi command length is 6 bytes. */

	buf +=3D SZ_SG_HEADER;
	if (get_user(opcode, buf))
		return -EFAULT;

	if (!(srp =3D sg_add_request(sfp))) {
		SCSI_LOG_TIMEOUT(1, sg_printk(KERN_INFO, sdp,
					      "sg_write: queue full\n"));
		return -EDOM;
	}
	mutex_lock(&sfp->f_mutex);
	if (sfp->next_cmd_len > 0) {
		cmd_size =3D sfp->next_cmd_len;
		sfp->next_cmd_len =3D 0;	/* reset so only this write() effected */
	} else {
		cmd_size =3D COMMAND_SIZE(opcode);	/* based on SCSI command group */
		if ((opcode >=3D 0xc0) && old_hdr.twelve_byte)
			cmd_size =3D 12;
	}
	mutex_unlock(&sfp->f_mutex);
	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sdp,
		"sg_write:   scsi opcode=3D0x%02x, cmd_size=3D%d\n", (int) opcode, cmd_si=
ze));
/* Determine buffer size.  */
	input_size =3D count - cmd_size;
	mxsize =3D (input_size > old_hdr.reply_len) ? input_size : old_hdr.reply_l=
en;
	mxsize -=3D SZ_SG_HEADER;
	input_size -=3D SZ_SG_HEADER;
	if (input_size < 0) {
		sg_remove_request(sfp, srp);
		return -EIO;	/* User did not pass enough bytes for this command. */
	}
	hp =3D &srp->header;
	hp->interface_id =3D '\0';	/* indicator of old interface tunnelled */
	hp->cmd_len =3D (unsigned char) cmd_size;
	hp->iovec_count =3D 0;
	hp->mx_sb_len =3D 0;
	if (input_size > 0)
		hp->dxfer_direction =3D (old_hdr.reply_len > SZ_SG_HEADER) ?
		    SG_DXFER_TO_FROM_DEV : SG_DXFER_TO_DEV;
	else
		hp->dxfer_direction =3D (mxsize > 0) ? SG_DXFER_FROM_DEV : SG_DXFER_NONE;
	hp->dxfer_len =3D mxsize;
	if ((hp->dxfer_direction =3D=3D SG_DXFER_TO_DEV) ||
	    (hp->dxfer_direction =3D=3D SG_DXFER_TO_FROM_DEV))
		hp->dxferp =3D (char __user *)buf + cmd_size;
	else
		hp->dxferp =3D NULL;
	hp->sbp =3D NULL;
	hp->timeout =3D old_hdr.reply_len;	/* structure abuse ... */
	hp->flags =3D input_size;	/* structure abuse ... */
	hp->pack_id =3D old_hdr.pack_id;
	hp->usr_ptr =3D NULL;
	if (copy_from_user(cmnd, buf, cmd_size))
		return -EFAULT;
	/*
	 * SG_DXFER_TO_FROM_DEV is functionally equivalent to SG_DXFER_FROM_DEV,
	 * but is is possible that the app intended SG_DXFER_TO_DEV, because there
	 * is a non-zero input_size, so emit a warning.
	 */
	if (hp->dxfer_direction =3D=3D SG_DXFER_TO_FROM_DEV) {
		printk_ratelimited(KERN_WARNING
				   "sg_write: data in/out %d/%d bytes "
				   "for SCSI command 0x%x-- guessing "
				   "data in;\n   program %s not setting "
				   "count and/or reply_len properly\n",
				   old_hdr.reply_len - (int)SZ_SG_HEADER,
				   input_size, (unsigned int) cmnd[0],
				   current->comm);
	}
	k =3D sg_common_write(sfp, srp, cmnd, sfp->timeout, blocking);
	return (k < 0) ? k : count;
}

static ssize_t
sg_new_write(Sg_fd *sfp, struct file *file, const char __user *buf,
		 size_t count, int blocking, int read_only, int sg_io_owned,
		 Sg_request **o_srp)
{
	int k;
	Sg_request *srp;
	sg_io_hdr_t *hp;
	unsigned char cmnd[SG_MAX_CDB_SIZE];
	int timeout;
	unsigned long ul_timeout;

	if (count < SZ_SG_IO_HDR)
		return -EINVAL;

	sfp->cmd_q =3D 1;	/* when sg_io_hdr seen, set command queuing on */
	if (!(srp =3D sg_add_request(sfp))) {
		SCSI_LOG_TIMEOUT(1, sg_printk(KERN_INFO, sfp->parentdp,
					      "sg_new_write: queue full\n"));
		return -EDOM;
	}
	srp->sg_io_owned =3D sg_io_owned;
	hp =3D &srp->header;
	if (get_sg_io_hdr(hp, buf)) {
		sg_remove_request(sfp, srp);
		return -EFAULT;
	}
	if (hp->interface_id !=3D 'S') {
		sg_remove_request(sfp, srp);
		return -ENOSYS;
	}
	if (hp->flags & SG_FLAG_MMAP_IO) {
		if (hp->dxfer_len > sfp->reserve.bufflen) {
			sg_remove_request(sfp, srp);
			return -ENOMEM;	/* MMAP_IO size must fit in reserve buffer */
		}
		if (hp->flags & SG_FLAG_DIRECT_IO) {
			sg_remove_request(sfp, srp);
			return -EINVAL;	/* either MMAP_IO or DIRECT_IO (not both) */
		}
		if (sfp->res_in_use) {
			sg_remove_request(sfp, srp);
			return -EBUSY;	/* reserve buffer already being used */
		}
	}
	ul_timeout =3D msecs_to_jiffies(srp->header.timeout);
	timeout =3D (ul_timeout < INT_MAX) ? ul_timeout : INT_MAX;
	if ((!hp->cmdp) || (hp->cmd_len < 6) || (hp->cmd_len > sizeof (cmnd))) {
		sg_remove_request(sfp, srp);
		return -EMSGSIZE;
	}
	if (copy_from_user(cmnd, hp->cmdp, hp->cmd_len)) {
		sg_remove_request(sfp, srp);
		return -EFAULT;
	}
	if (read_only && sg_allow_access(file, cmnd)) {
		sg_remove_request(sfp, srp);
		return -EPERM;
	}
	k =3D sg_common_write(sfp, srp, cmnd, timeout, blocking);
	if (k < 0)
		return k;
	if (o_srp)
		*o_srp =3D srp;
	return count;
}

static int
sg_common_write(Sg_fd * sfp, Sg_request * srp,
		unsigned char *cmnd, int timeout, int blocking)
{
	int k, at_head;
	Sg_device *sdp =3D sfp->parentdp;
	sg_io_hdr_t *hp =3D &srp->header;

	srp->data.cmd_opcode =3D cmnd[0];	/* hold opcode of command */
	hp->status =3D 0;
	hp->masked_status =3D 0;
	hp->msg_status =3D 0;
	hp->info =3D 0;
	hp->host_status =3D 0;
	hp->driver_status =3D 0;
	hp->resid =3D 0;
	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
			"sg_common_write:  scsi opcode=3D0x%02x, cmd_size=3D%d\n",
			(int) cmnd[0], (int) hp->cmd_len));

	if (hp->dxfer_len >=3D SZ_256M)
		return -EINVAL;

	k =3D sg_start_req(srp, cmnd);
	if (k) {
		SCSI_LOG_TIMEOUT(1, sg_printk(KERN_INFO, sfp->parentdp,
			"sg_common_write: start_req err=3D%d\n", k));
		sg_finish_rem_req(srp);
		sg_remove_request(sfp, srp);
		return k;	/* probably out of space --> ENOMEM */
	}
	if (atomic_read(&sdp->detaching)) {
		if (srp->bio) {
			scsi_req_free_cmd(scsi_req(srp->rq));
			blk_put_request(srp->rq);
			srp->rq =3D NULL;
		}

		sg_finish_rem_req(srp);
		sg_remove_request(sfp, srp);
		return -ENODEV;
	}

	hp->duration =3D jiffies_to_msecs(jiffies);
	if (hp->interface_id !=3D '\0' &&	/* v3 (or later) interface */
	    (SG_FLAG_Q_AT_TAIL & hp->flags))
		at_head =3D 0;
	else
		at_head =3D 1;

	srp->rq->timeout =3D timeout;
	kref_get(&sfp->f_ref); /* sg_rq_end_io() does kref_put(). */
	blk_execute_rq_nowait(sdp->device->request_queue, sdp->disk,
			      srp->rq, at_head, sg_rq_end_io);
	return 0;
}

static int srp_done(Sg_fd *sfp, Sg_request *srp)
{
	unsigned long flags;
	int ret;

	read_lock_irqsave(&sfp->rq_list_lock, flags);
	ret =3D srp->done;
	read_unlock_irqrestore(&sfp->rq_list_lock, flags);
	return ret;
}

static int max_sectors_bytes(struct request_queue *q)
{
	unsigned int max_sectors =3D queue_max_sectors(q);

	max_sectors =3D min_t(unsigned int, max_sectors, INT_MAX >> 9);

	return max_sectors << 9;
}

static void
sg_fill_request_table(Sg_fd *sfp, sg_req_info_t *rinfo)
{
	Sg_request *srp;
	int val;
	unsigned int ms;

	val =3D 0;
	list_for_each_entry(srp, &sfp->rq_list, entry) {
		if (val >=3D SG_MAX_QUEUE)
			break;
		rinfo[val].req_state =3D srp->done + 1;
		rinfo[val].problem =3D
			srp->header.masked_status &
			srp->header.host_status &
			srp->header.driver_status;
		if (srp->done)
			rinfo[val].duration =3D
				srp->header.duration;
		else {
			ms =3D jiffies_to_msecs(jiffies);
			rinfo[val].duration =3D
				(ms > srp->header.duration) ?
				(ms - srp->header.duration) : 0;
		}
		rinfo[val].orphan =3D srp->orphan;
		rinfo[val].sg_io_owned =3D srp->sg_io_owned;
		rinfo[val].pack_id =3D srp->header.pack_id;
		rinfo[val].usr_ptr =3D srp->header.usr_ptr;
		val++;
	}
}

#ifdef CONFIG_COMPAT
struct compat_sg_req_info { /* used by SG_GET_REQUEST_TABLE ioctl() */
	char req_state;
	char orphan;
	char sg_io_owned;
	char problem;
	int pack_id;
	compat_uptr_t usr_ptr;
	unsigned int duration;
	int unused;
};

static int put_compat_request_table(struct compat_sg_req_info __user *o,
				    struct sg_req_info *rinfo)
{
	int i;
	for (i =3D 0; i < SG_MAX_QUEUE; i++) {
		if (copy_to_user(o + i, rinfo + i, offsetof(sg_req_info_t, usr_ptr)) ||
		    put_user((uintptr_t)rinfo[i].usr_ptr, &o[i].usr_ptr) ||
		    put_user(rinfo[i].duration, &o[i].duration) ||
		    put_user(rinfo[i].unused, &o[i].unused))
			return -EFAULT;
	}
	return 0;
}
#endif

static long
sg_ioctl(struct file *filp, unsigned int cmd_in, unsigned long arg)
{
	void __user *p =3D (void __user *)arg;
	int __user *ip =3D p;
	int result, val, read_only;
	Sg_device *sdp;
	Sg_fd *sfp;
	Sg_request *srp;
	unsigned long iflags;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;

	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				   "sg_ioctl: cmd=3D0x%x\n", (int) cmd_in));
	read_only =3D (O_RDWR !=3D (filp->f_flags & O_ACCMODE));

	switch (cmd_in) {
	case SG_IO:
		if (atomic_read(&sdp->detaching))
			return -ENODEV;
		if (!scsi_block_when_processing_errors(sdp->device))
			return -ENXIO;
		result =3D sg_new_write(sfp, filp, p, SZ_SG_IO_HDR,
				 1, read_only, 1, &srp);
		if (result < 0)
			return result;
		result =3D wait_event_interruptible(sfp->read_wait,
			(srp_done(sfp, srp) || atomic_read(&sdp->detaching)));
		if (atomic_read(&sdp->detaching))
			return -ENODEV;
		write_lock_irq(&sfp->rq_list_lock);
		if (srp->done) {
			srp->done =3D 2;
			write_unlock_irq(&sfp->rq_list_lock);
			result =3D sg_new_read(sfp, p, SZ_SG_IO_HDR, srp);
			return (result < 0) ? result : 0;
		}
		srp->orphan =3D 1;
		write_unlock_irq(&sfp->rq_list_lock);
		return result;	/* -ERESTARTSYS because signal hit process */
	case SG_SET_TIMEOUT:
		result =3D get_user(val, ip);
		if (result)
			return result;
		if (val < 0)
			return -EIO;
		if (val >=3D mult_frac((s64)INT_MAX, USER_HZ, HZ))
			val =3D min_t(s64, mult_frac((s64)INT_MAX, USER_HZ, HZ),
				    INT_MAX);
		sfp->timeout_user =3D val;
		sfp->timeout =3D mult_frac(val, HZ, USER_HZ);

		return 0;
	case SG_GET_TIMEOUT:	/* N.B. User receives timeout as return value */
				/* strange ..., for backward compatibility */
		return sfp->timeout_user;
	case SG_SET_FORCE_LOW_DMA:
		/*
		 * N.B. This ioctl never worked properly, but failed to
		 * return an error value. So returning '0' to keep compability
		 * with legacy applications.
		 */
		return 0;
	case SG_GET_LOW_DMA:
		return put_user((int) sdp->device->host->unchecked_isa_dma, ip);
	case SG_GET_SCSI_ID:
		{
			sg_scsi_id_t v;

			if (atomic_read(&sdp->detaching))
				return -ENODEV;
			memset(&v, 0, sizeof(v));
			v.host_no =3D sdp->device->host->host_no;
			v.channel =3D sdp->device->channel;
			v.scsi_id =3D sdp->device->id;
			v.lun =3D sdp->device->lun;
			v.scsi_type =3D sdp->device->type;
			v.h_cmd_per_lun =3D sdp->device->host->cmd_per_lun;
			v.d_queue_depth =3D sdp->device->queue_depth;
			if (copy_to_user(p, &v, sizeof(sg_scsi_id_t)))
				return -EFAULT;
			return 0;
		}
	case SG_SET_FORCE_PACK_ID:
		result =3D get_user(val, ip);
		if (result)
			return result;
		sfp->force_packid =3D val ? 1 : 0;
		return 0;
	case SG_GET_PACK_ID:
		read_lock_irqsave(&sfp->rq_list_lock, iflags);
		list_for_each_entry(srp, &sfp->rq_list, entry) {
			if ((1 =3D=3D srp->done) && (!srp->sg_io_owned)) {
				read_unlock_irqrestore(&sfp->rq_list_lock,
						       iflags);
				return put_user(srp->header.pack_id, ip);
			}
		}
		read_unlock_irqrestore(&sfp->rq_list_lock, iflags);
		return put_user(-1, ip);
	case SG_GET_NUM_WAITING:
		read_lock_irqsave(&sfp->rq_list_lock, iflags);
		val =3D 0;
		list_for_each_entry(srp, &sfp->rq_list, entry) {
			if ((1 =3D=3D srp->done) && (!srp->sg_io_owned))
				++val;
		}
		read_unlock_irqrestore(&sfp->rq_list_lock, iflags);
		return put_user(val, ip);
	case SG_GET_SG_TABLESIZE:
		return put_user(sdp->sg_tablesize, ip);
	case SG_SET_RESERVED_SIZE:
		result =3D get_user(val, ip);
		if (result)
			return result;
                if (val < 0)
                        return -EINVAL;
		val =3D min_t(int, val,
			    max_sectors_bytes(sdp->device->request_queue));
		mutex_lock(&sfp->f_mutex);
		if (val !=3D sfp->reserve.bufflen) {
			if (sfp->mmap_called ||
			    sfp->res_in_use) {
				mutex_unlock(&sfp->f_mutex);
				return -EBUSY;
			}

			sg_remove_scat(sfp, &sfp->reserve);
			sg_build_reserve(sfp, val);
		}
		mutex_unlock(&sfp->f_mutex);
		return 0;
	case SG_GET_RESERVED_SIZE:
		val =3D min_t(int, sfp->reserve.bufflen,
			    max_sectors_bytes(sdp->device->request_queue));
		return put_user(val, ip);
	case SG_SET_COMMAND_Q:
		result =3D get_user(val, ip);
		if (result)
			return result;
		sfp->cmd_q =3D val ? 1 : 0;
		return 0;
	case SG_GET_COMMAND_Q:
		return put_user((int) sfp->cmd_q, ip);
	case SG_SET_KEEP_ORPHAN:
		result =3D get_user(val, ip);
		if (result)
			return result;
		sfp->keep_orphan =3D val;
		return 0;
	case SG_GET_KEEP_ORPHAN:
		return put_user((int) sfp->keep_orphan, ip);
	case SG_NEXT_CMD_LEN:
		result =3D get_user(val, ip);
		if (result)
			return result;
		if (val > SG_MAX_CDB_SIZE)
			return -ENOMEM;
		sfp->next_cmd_len =3D (val > 0) ? val : 0;
		return 0;
	case SG_GET_VERSION_NUM:
		return put_user(sg_version_num, ip);
	case SG_GET_ACCESS_COUNT:
		/* faked - we don't have a real access count anymore */
		val =3D (sdp->device ? 1 : 0);
		return put_user(val, ip);
	case SG_GET_REQUEST_TABLE:
		{
			sg_req_info_t *rinfo;

			rinfo =3D kcalloc(SG_MAX_QUEUE, SZ_SG_REQ_INFO,
					GFP_KERNEL);
			if (!rinfo)
				return -ENOMEM;
			read_lock_irqsave(&sfp->rq_list_lock, iflags);
			sg_fill_request_table(sfp, rinfo);
			read_unlock_irqrestore(&sfp->rq_list_lock, iflags);
	#ifdef CONFIG_COMPAT
			if (in_compat_syscall())
				result =3D put_compat_request_table(p, rinfo);
			else
	#endif
				result =3D copy_to_user(p, rinfo,
						      SZ_SG_REQ_INFO * SG_MAX_QUEUE);
			result =3D result ? -EFAULT : 0;
			kfree(rinfo);
			return result;
		}
	case SG_EMULATED_HOST:
		if (atomic_read(&sdp->detaching))
			return -ENODEV;
		return put_user(sdp->device->host->hostt->emulated, ip);
	case SCSI_IOCTL_SEND_COMMAND:
		if (atomic_read(&sdp->detaching))
			return -ENODEV;
		return sg_scsi_ioctl(sdp->device->request_queue, NULL, filp->f_mode, p);
	case SG_SET_DEBUG:
		result =3D get_user(val, ip);
		if (result)
			return result;
		sdp->sgdebug =3D (char) val;
		return 0;
	case BLKSECTGET:
		return put_user(max_sectors_bytes(sdp->device->request_queue),
				ip);
	case BLKTRACESETUP:
		return blk_trace_setup(sdp->device->request_queue,
				       sdp->disk->disk_name,
				       MKDEV(SCSI_GENERIC_MAJOR, sdp->index),
				       NULL, p);
	case BLKTRACESTART:
		return blk_trace_startstop(sdp->device->request_queue, 1);
	case BLKTRACESTOP:
		return blk_trace_startstop(sdp->device->request_queue, 0);
	case BLKTRACETEARDOWN:
		return blk_trace_remove(sdp->device->request_queue);
	case SCSI_IOCTL_GET_IDLUN:
	case SCSI_IOCTL_GET_BUS_NUMBER:
	case SCSI_IOCTL_PROBE_HOST:
	case SG_GET_TRANSFORM:
	case SG_SCSI_RESET:
		if (atomic_read(&sdp->detaching))
			return -ENODEV;
		break;
	default:
		if (read_only)
			return -EPERM;	/* don't know so take safe approach */
		break;
	}

	result =3D scsi_ioctl_block_when_processing_errors(sdp->device,
			cmd_in, filp->f_flags & O_NDELAY);
	if (result)
		return result;
	return scsi_ioctl(sdp->device, cmd_in, p);
}

#ifdef CONFIG_COMPAT
static long sg_compat_ioctl(struct file *filp, unsigned int cmd_in, unsigne=
d long arg)
{
	Sg_device *sdp;
	Sg_fd *sfp;
	struct scsi_device *sdev;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;

	sdev =3D sdp->device;
	if (sdev->host->hostt->compat_ioctl) {=20
		int ret;

		ret =3D sdev->host->hostt->compat_ioctl(sdev, cmd_in, (void __user *)arg);

		return ret;
	}
=09
	return -ENOIOCTLCMD;
}
#endif

static __poll_t
sg_poll(struct file *filp, poll_table * wait)
{
	__poll_t res =3D 0;
	Sg_device *sdp;
	Sg_fd *sfp;
	Sg_request *srp;
	int count =3D 0;
	unsigned long iflags;

	sfp =3D filp->private_data;
	if (!sfp)
		return EPOLLERR;
	sdp =3D sfp->parentdp;
	if (!sdp)
		return EPOLLERR;
	poll_wait(filp, &sfp->read_wait, wait);
	read_lock_irqsave(&sfp->rq_list_lock, iflags);
	list_for_each_entry(srp, &sfp->rq_list, entry) {
		/* if any read waiting, flag it */
		if ((0 =3D=3D res) && (1 =3D=3D srp->done) && (!srp->sg_io_owned))
			res =3D EPOLLIN | EPOLLRDNORM;
		++count;
	}
	read_unlock_irqrestore(&sfp->rq_list_lock, iflags);

	if (atomic_read(&sdp->detaching))
		res |=3D EPOLLHUP;
	else if (!sfp->cmd_q) {
		if (0 =3D=3D count)
			res |=3D EPOLLOUT | EPOLLWRNORM;
	} else if (count < SG_MAX_QUEUE)
		res |=3D EPOLLOUT | EPOLLWRNORM;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_poll: res=3D0x%x\n", (__force u32) res));
	return res;
}

static int
sg_fasync(int fd, struct file *filp, int mode)
{
	Sg_device *sdp;
	Sg_fd *sfp;

	if ((!(sfp =3D (Sg_fd *) filp->private_data)) || (!(sdp =3D sfp->parentdp)=
))
		return -ENXIO;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_fasync: mode=3D%d\n", mode));

	return fasync_helper(fd, filp, mode, &sfp->async_qp);
}

static vm_fault_t
sg_vma_fault(struct vm_fault *vmf)
{
	struct vm_area_struct *vma =3D vmf->vma;
	Sg_fd *sfp;
	unsigned long offset, len, sa;
	Sg_scatter_hold *rsv_schp;
	int k, length;

	if ((NULL =3D=3D vma) || (!(sfp =3D (Sg_fd *) vma->vm_private_data)))
		return VM_FAULT_SIGBUS;
	rsv_schp =3D &sfp->reserve;
	offset =3D vmf->pgoff << PAGE_SHIFT;
	if (offset >=3D rsv_schp->bufflen)
		return VM_FAULT_SIGBUS;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sfp->parentdp,
				      "sg_vma_fault: offset=3D%lu, scatg=3D%d\n",
				      offset, rsv_schp->k_use_sg));
	sa =3D vma->vm_start;
	length =3D 1 << (PAGE_SHIFT + rsv_schp->page_order);
	for (k =3D 0; k < rsv_schp->k_use_sg && sa < vma->vm_end; k++) {
		len =3D vma->vm_end - sa;
		len =3D (len < length) ? len : length;
		if (offset < len) {
			struct page *page =3D nth_page(rsv_schp->pages[k],
						     offset >> PAGE_SHIFT);
			get_page(page);	/* increment page count */
			vmf->page =3D page;
			return 0; /* success */
		}
		sa +=3D len;
		offset -=3D len;
	}

	return VM_FAULT_SIGBUS;
}

static const struct vm_operations_struct sg_mmap_vm_ops =3D {
	.fault =3D sg_vma_fault,
};

static int
sg_mmap(struct file *filp, struct vm_area_struct *vma)
{
	Sg_fd *sfp;
	unsigned long req_sz, len, sa;
	Sg_scatter_hold *rsv_schp;
	int k, length;
	int ret =3D 0;

	if ((!filp) || (!vma) || (!(sfp =3D (Sg_fd *) filp->private_data)))
		return -ENXIO;
	req_sz =3D vma->vm_end - vma->vm_start;
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sfp->parentdp,
				      "sg_mmap starting, vm_start=3D%p, len=3D%d\n",
				      (void *) vma->vm_start, (int) req_sz));
	if (vma->vm_pgoff)
		return -EINVAL;	/* want no offset */
	rsv_schp =3D &sfp->reserve;
	mutex_lock(&sfp->f_mutex);
	if (req_sz > rsv_schp->bufflen) {
		ret =3D -ENOMEM;	/* cannot map more than reserved buffer */
		goto out;
	}

	sa =3D vma->vm_start;
	length =3D 1 << (PAGE_SHIFT + rsv_schp->page_order);
	for (k =3D 0; k < rsv_schp->k_use_sg && sa < vma->vm_end; k++) {
		len =3D vma->vm_end - sa;
		len =3D (len < length) ? len : length;
		sa +=3D len;
	}

	sfp->mmap_called =3D 1;
	vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
	vma->vm_private_data =3D sfp;
	vma->vm_ops =3D &sg_mmap_vm_ops;
out:
	mutex_unlock(&sfp->f_mutex);
	return ret;
}

static void
sg_rq_end_io_usercontext(struct work_struct *work)
{
	struct sg_request *srp =3D container_of(work, struct sg_request, ew.work);
	struct sg_fd *sfp =3D srp->parentfp;

	sg_finish_rem_req(srp);
	sg_remove_request(sfp, srp);
	kref_put(&sfp->f_ref, sg_remove_sfp);
}

/*
 * This function is a "bottom half" handler that is called by the mid
 * level when a command is completed (or has failed).
 */
static void
sg_rq_end_io(struct request *rq, blk_status_t status)
{
	struct sg_request *srp =3D rq->end_io_data;
	struct scsi_request *req =3D scsi_req(rq);
	Sg_device *sdp;
	Sg_fd *sfp;
	unsigned long iflags;
	unsigned int ms;
	char *sense;
	int result, resid, done =3D 1;

	if (WARN_ON(srp->done !=3D 0))
		return;

	sfp =3D srp->parentfp;
	if (WARN_ON(sfp =3D=3D NULL))
		return;

	sdp =3D sfp->parentdp;
	if (unlikely(atomic_read(&sdp->detaching)))
		pr_info("%s: device detaching\n", __func__);

	sense =3D req->sense;
	result =3D req->result;
	resid =3D req->resid_len;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sdp,
				      "sg_cmd_done: pack_id=3D%d, res=3D0x%x\n",
				      srp->header.pack_id, result));
	srp->header.resid =3D resid;
	ms =3D jiffies_to_msecs(jiffies);
	srp->header.duration =3D (ms > srp->header.duration) ?
				(ms - srp->header.duration) : 0;
	if (0 !=3D result) {
		struct scsi_sense_hdr sshdr;

		srp->header.status =3D 0xff & result;
		srp->header.masked_status =3D status_byte(result);
		srp->header.msg_status =3D msg_byte(result);
		srp->header.host_status =3D host_byte(result);
		srp->header.driver_status =3D driver_byte(result);
		if ((sdp->sgdebug > 0) &&
		    ((CHECK_CONDITION =3D=3D srp->header.masked_status) ||
		     (COMMAND_TERMINATED =3D=3D srp->header.masked_status)))
			__scsi_print_sense(sdp->device, __func__, sense,
					   SCSI_SENSE_BUFFERSIZE);

		/* Following if statement is a patch supplied by Eric Youngdale */
		if (driver_byte(result) !=3D 0
		    && scsi_normalize_sense(sense, SCSI_SENSE_BUFFERSIZE, &sshdr)
		    && !scsi_sense_is_deferred(&sshdr)
		    && sshdr.sense_key =3D=3D UNIT_ATTENTION
		    && sdp->device->removable) {
			/* Detected possible disc change. Set the bit - this */
			/* may be used if there are filesystems using this device */
			sdp->device->changed =3D 1;
		}
	}

	if (req->sense_len)
		memcpy(srp->sense_b, req->sense, SCSI_SENSE_BUFFERSIZE);

	/* Rely on write phase to clean out srp status values, so no "else" */

	/*
	 * Free the request as soon as it is complete so that its resources
	 * can be reused without waiting for userspace to read() the
	 * result.  But keep the associated bio (if any) around until
	 * blk_rq_unmap_user() can be called from user context.
	 */
	srp->rq =3D NULL;
	scsi_req_free_cmd(scsi_req(rq));
	blk_put_request(rq);

	write_lock_irqsave(&sfp->rq_list_lock, iflags);
	if (unlikely(srp->orphan)) {
		if (sfp->keep_orphan)
			srp->sg_io_owned =3D 0;
		else
			done =3D 0;
	}
	srp->done =3D done;
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);

	if (likely(done)) {
		/* Now wake up any sg_read() that is waiting for this
		 * packet.
		 */
		wake_up_interruptible(&sfp->read_wait);
		kill_fasync(&sfp->async_qp, SIGPOLL, POLL_IN);
		kref_put(&sfp->f_ref, sg_remove_sfp);
	} else {
		INIT_WORK(&srp->ew.work, sg_rq_end_io_usercontext);
		schedule_work(&srp->ew.work);
	}
}

static const struct file_operations sg_fops =3D {
	.owner =3D THIS_MODULE,
	.read =3D sg_read,
	.write =3D sg_write,
	.poll =3D sg_poll,
	.unlocked_ioctl =3D sg_ioctl,
#ifdef CONFIG_COMPAT
	.compat_ioctl =3D sg_compat_ioctl,
#endif
	.open =3D sg_open,
	.mmap =3D sg_mmap,
	.release =3D sg_release,
	.fasync =3D sg_fasync,
	.llseek =3D no_llseek,
};

static struct class *sg_sysfs_class;

static int sg_sysfs_valid =3D 0;

static Sg_device *
sg_alloc(struct gendisk *disk, struct scsi_device *scsidp)
{
	struct request_queue *q =3D scsidp->request_queue;
	Sg_device *sdp;
	unsigned long iflags;
	int error;
	u32 k;

	sdp =3D kzalloc(sizeof(Sg_device), GFP_KERNEL);
	if (!sdp) {
		sdev_printk(KERN_WARNING, scsidp, "%s: kmalloc Sg_device "
			    "failure\n", __func__);
		return ERR_PTR(-ENOMEM);
	}

	idr_preload(GFP_KERNEL);
	write_lock_irqsave(&sg_index_lock, iflags);

	error =3D idr_alloc(&sg_index_idr, sdp, 0, SG_MAX_DEVS, GFP_NOWAIT);
	if (error < 0) {
		if (error =3D=3D -ENOSPC) {
			sdev_printk(KERN_WARNING, scsidp,
				    "Unable to attach sg device type=3D%d, minor number exceeds %d\n",
				    scsidp->type, SG_MAX_DEVS - 1);
			error =3D -ENODEV;
		} else {
			sdev_printk(KERN_WARNING, scsidp, "%s: idr "
				    "allocation Sg_device failure: %d\n",
				    __func__, error);
		}
		goto out_unlock;
	}
	k =3D error;

	SCSI_LOG_TIMEOUT(3, sdev_printk(KERN_INFO, scsidp,
					"sg_alloc: dev=3D%d \n", k));
	sprintf(disk->disk_name, "sg%d", k);
	disk->first_minor =3D k;
	sdp->disk =3D disk;
	sdp->device =3D scsidp;
	mutex_init(&sdp->open_rel_lock);
	INIT_LIST_HEAD(&sdp->sfds);
	init_waitqueue_head(&sdp->open_wait);
	atomic_set(&sdp->detaching, 0);
	rwlock_init(&sdp->sfd_lock);
	sdp->sg_tablesize =3D queue_max_segments(q);
	sdp->index =3D k;
	kref_init(&sdp->d_ref);
	error =3D 0;

out_unlock:
	write_unlock_irqrestore(&sg_index_lock, iflags);
	idr_preload_end();

	if (error) {
		kfree(sdp);
		return ERR_PTR(error);
	}
	return sdp;
}

static int
sg_add_device(struct device *cl_dev, struct class_interface *cl_intf)
{
	struct scsi_device *scsidp =3D to_scsi_device(cl_dev->parent);
	struct gendisk *disk;
	Sg_device *sdp =3D NULL;
	struct cdev * cdev =3D NULL;
	int error;
	unsigned long iflags;

	disk =3D alloc_disk(1);
	if (!disk) {
		pr_warn("%s: alloc_disk failed\n", __func__);
		return -ENOMEM;
	}
	disk->major =3D SCSI_GENERIC_MAJOR;

	error =3D -ENOMEM;
	cdev =3D cdev_alloc();
	if (!cdev) {
		pr_warn("%s: cdev_alloc failed\n", __func__);
		goto out;
	}
	cdev->owner =3D THIS_MODULE;
	cdev->ops =3D &sg_fops;

	sdp =3D sg_alloc(disk, scsidp);
	if (IS_ERR(sdp)) {
		pr_warn("%s: sg_alloc failed\n", __func__);
		error =3D PTR_ERR(sdp);
		goto out;
	}

	error =3D cdev_add(cdev, MKDEV(SCSI_GENERIC_MAJOR, sdp->index), 1);
	if (error)
		goto cdev_add_err;

	sdp->cdev =3D cdev;
	if (sg_sysfs_valid) {
		struct device *sg_class_member;

		sg_class_member =3D device_create(sg_sysfs_class, cl_dev->parent,
						MKDEV(SCSI_GENERIC_MAJOR,
						      sdp->index),
						sdp, "%s", disk->disk_name);
		if (IS_ERR(sg_class_member)) {
			pr_err("%s: device_create failed\n", __func__);
			error =3D PTR_ERR(sg_class_member);
			goto cdev_add_err;
		}
		error =3D sysfs_create_link(&scsidp->sdev_gendev.kobj,
					  &sg_class_member->kobj, "generic");
		if (error)
			pr_err("%s: unable to make symlink 'generic' back "
			       "to sg%d\n", __func__, sdp->index);
	} else
		pr_warn("%s: sg_sys Invalid\n", __func__);

	sdev_printk(KERN_NOTICE, scsidp, "Attached scsi generic sg%d "
		    "type %d\n", sdp->index, scsidp->type);

	dev_set_drvdata(cl_dev, sdp);

	return 0;

cdev_add_err:
	write_lock_irqsave(&sg_index_lock, iflags);
	idr_remove(&sg_index_idr, sdp->index);
	write_unlock_irqrestore(&sg_index_lock, iflags);
	kfree(sdp);

out:
	put_disk(disk);
	if (cdev)
		cdev_del(cdev);
	return error;
}

static void
sg_device_destroy(struct kref *kref)
{
	struct sg_device *sdp =3D container_of(kref, struct sg_device, d_ref);
	unsigned long flags;

	/* CAUTION!  Note that the device can still be found via idr_find()
	 * even though the refcount is 0.  Therefore, do idr_remove() BEFORE
	 * any other cleanup.
	 */

	write_lock_irqsave(&sg_index_lock, flags);
	idr_remove(&sg_index_idr, sdp->index);
	write_unlock_irqrestore(&sg_index_lock, flags);

	SCSI_LOG_TIMEOUT(3,
		sg_printk(KERN_INFO, sdp, "sg_device_destroy\n"));

	put_disk(sdp->disk);
	kfree(sdp);
}

static void
sg_remove_device(struct device *cl_dev, struct class_interface *cl_intf)
{
	struct scsi_device *scsidp =3D to_scsi_device(cl_dev->parent);
	Sg_device *sdp =3D dev_get_drvdata(cl_dev);
	unsigned long iflags;
	Sg_fd *sfp;
	int val;

	if (!sdp)
		return;
	/* want sdp->detaching non-zero as soon as possible */
	val =3D atomic_inc_return(&sdp->detaching);
	if (val > 1)
		return; /* only want to do following once per device */

	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "%s\n", __func__));

	read_lock_irqsave(&sdp->sfd_lock, iflags);
	list_for_each_entry(sfp, &sdp->sfds, sfd_siblings) {
		wake_up_interruptible_all(&sfp->read_wait);
		kill_fasync(&sfp->async_qp, SIGPOLL, POLL_HUP);
	}
	wake_up_interruptible_all(&sdp->open_wait);
	read_unlock_irqrestore(&sdp->sfd_lock, iflags);

	sysfs_remove_link(&scsidp->sdev_gendev.kobj, "generic");
	device_destroy(sg_sysfs_class, MKDEV(SCSI_GENERIC_MAJOR, sdp->index));
	cdev_del(sdp->cdev);
	sdp->cdev =3D NULL;

	kref_put(&sdp->d_ref, sg_device_destroy);
}

module_param_named(scatter_elem_sz, scatter_elem_sz, int, S_IRUGO | S_IWUSR=
);
module_param_named(def_reserved_size, def_reserved_size, int,
		   S_IRUGO | S_IWUSR);
module_param_named(allow_dio, sg_allow_dio, int, S_IRUGO | S_IWUSR);

MODULE_AUTHOR("Douglas Gilbert");
MODULE_DESCRIPTION("SCSI generic (sg) driver");
MODULE_LICENSE("GPL");
MODULE_VERSION(SG_VERSION_STR);
MODULE_ALIAS_CHARDEV_MAJOR(SCSI_GENERIC_MAJOR);

MODULE_PARM_DESC(scatter_elem_sz, "scatter gather element "
                "size (default: max(SG_SCATTER_SZ, PAGE_SIZE))");
MODULE_PARM_DESC(def_reserved_size, "size of buffer reserved for each fd");
MODULE_PARM_DESC(allow_dio, "allow direct I/O (default: 0 (disallow))");

static int __init
init_sg(void)
{
	int rc;

	if (scatter_elem_sz < PAGE_SIZE) {
		scatter_elem_sz =3D PAGE_SIZE;
		scatter_elem_sz_prev =3D scatter_elem_sz;
	}
	if (def_reserved_size >=3D 0)
		sg_big_buff =3D def_reserved_size;
	else
		def_reserved_size =3D sg_big_buff;

	rc =3D register_chrdev_region(MKDEV(SCSI_GENERIC_MAJOR, 0),=20
				    SG_MAX_DEVS, "sg");
	if (rc)
		return rc;
        sg_sysfs_class =3D class_create(THIS_MODULE, "scsi_generic");
        if ( IS_ERR(sg_sysfs_class) ) {
		rc =3D PTR_ERR(sg_sysfs_class);
		goto err_out;
        }
	sg_sysfs_valid =3D 1;
	rc =3D scsi_register_interface(&sg_interface);
	if (0 =3D=3D rc) {
#ifdef CONFIG_SCSI_PROC_FS
		sg_proc_init();
#endif				/* CONFIG_SCSI_PROC_FS */
		return 0;
	}
	class_destroy(sg_sysfs_class);
err_out:
	unregister_chrdev_region(MKDEV(SCSI_GENERIC_MAJOR, 0), SG_MAX_DEVS);
	return rc;
}

static void __exit
exit_sg(void)
{
#ifdef CONFIG_SCSI_PROC_FS
	remove_proc_subtree("scsi/sg", NULL);
#endif				/* CONFIG_SCSI_PROC_FS */
	scsi_unregister_interface(&sg_interface);
	class_destroy(sg_sysfs_class);
	sg_sysfs_valid =3D 0;
	unregister_chrdev_region(MKDEV(SCSI_GENERIC_MAJOR, 0),
				 SG_MAX_DEVS);
	idr_destroy(&sg_index_idr);
}

static int
sg_start_req(Sg_request *srp, unsigned char *cmd)
{
	int res;
	struct request *rq;
	struct scsi_request *req;
	Sg_fd *sfp =3D srp->parentfp;
	sg_io_hdr_t *hp =3D &srp->header;
	int dxfer_len =3D (int) hp->dxfer_len;
	int dxfer_dir =3D hp->dxfer_direction;
	unsigned int iov_count =3D hp->iovec_count;
	Sg_scatter_hold *req_schp =3D &srp->data;
	Sg_scatter_hold *rsv_schp =3D &sfp->reserve;
	struct request_queue *q =3D sfp->parentdp->device->request_queue;
	struct rq_map_data *md, map_data;
	int rw =3D hp->dxfer_direction =3D=3D SG_DXFER_TO_DEV ? WRITE : READ;
	unsigned char *long_cmdp =3D NULL;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
				      "sg_start_req: dxfer_len=3D%d\n",
				      dxfer_len));

	if (hp->cmd_len > BLK_MAX_CDB) {
		long_cmdp =3D kzalloc(hp->cmd_len, GFP_KERNEL);
		if (!long_cmdp)
			return -ENOMEM;
	}

	/*
	 * NOTE
	 *
	 * With scsi-mq enabled, there are a fixed number of preallocated
	 * requests equal in number to shost->can_queue.  If all of the
	 * preallocated requests are already in use, then blk_get_request()
	 * will sleep until an active command completes, freeing up a request.
	 * Although waiting in an asynchronous interface is less than ideal, we
	 * do not want to use BLK_MQ_REQ_NOWAIT here because userspace might
	 * not expect an EWOULDBLOCK from this condition.
	 */
	rq =3D blk_get_request(q, hp->dxfer_direction =3D=3D SG_DXFER_TO_DEV ?
			REQ_OP_SCSI_OUT : REQ_OP_SCSI_IN, 0);
	if (IS_ERR(rq)) {
		kfree(long_cmdp);
		return PTR_ERR(rq);
	}
	req =3D scsi_req(rq);

	if (hp->cmd_len > BLK_MAX_CDB)
		req->cmd =3D long_cmdp;
	memcpy(req->cmd, cmd, hp->cmd_len);
	req->cmd_len =3D hp->cmd_len;

	srp->rq =3D rq;
	rq->end_io_data =3D srp;
	req->retries =3D SG_DEFAULT_RETRIES;

	if ((dxfer_len <=3D 0) || (dxfer_dir =3D=3D SG_DXFER_NONE))
		return 0;

	if (sg_allow_dio && hp->flags & SG_FLAG_DIRECT_IO &&
	    dxfer_dir !=3D SG_DXFER_UNKNOWN && !iov_count &&
	    !sfp->parentdp->device->host->unchecked_isa_dma &&
	    blk_rq_aligned(q, (unsigned long)hp->dxferp, dxfer_len))
		md =3D NULL;
	else
		md =3D &map_data;

	if (md) {
		mutex_lock(&sfp->f_mutex);
		if (dxfer_len <=3D rsv_schp->bufflen &&
		    !sfp->res_in_use) {
			sfp->res_in_use =3D 1;
			sg_link_reserve(sfp, srp, dxfer_len);
		} else if (hp->flags & SG_FLAG_MMAP_IO) {
			res =3D -EBUSY; /* sfp->res_in_use =3D=3D 1 */
			if (dxfer_len > rsv_schp->bufflen)
				res =3D -ENOMEM;
			mutex_unlock(&sfp->f_mutex);
			return res;
		} else {
			res =3D sg_build_indirect(req_schp, sfp, dxfer_len);
			if (res) {
				mutex_unlock(&sfp->f_mutex);
				return res;
			}
		}
		mutex_unlock(&sfp->f_mutex);

		md->pages =3D req_schp->pages;
		md->page_order =3D req_schp->page_order;
		md->nr_entries =3D req_schp->k_use_sg;
		md->offset =3D 0;
		md->null_mapped =3D hp->dxferp ? 0 : 1;
		if (dxfer_dir =3D=3D SG_DXFER_TO_FROM_DEV)
			md->from_user =3D 1;
		else
			md->from_user =3D 0;
	}

	if (iov_count) {
		struct iovec *iov =3D NULL;
		struct iov_iter i;

#ifdef CONFIG_COMPAT
		if (in_compat_syscall())
			res =3D compat_import_iovec(rw, hp->dxferp, iov_count,
						  0, &iov, &i);
		else
#endif
			res =3D import_iovec(rw, hp->dxferp, iov_count,
					   0, &iov, &i);
		if (res < 0)
			return res;

		iov_iter_truncate(&i, hp->dxfer_len);
		if (!iov_iter_count(&i)) {
			kfree(iov);
			return -EINVAL;
		}

		res =3D blk_rq_map_user_iov(q, rq, md, &i, GFP_ATOMIC);
		kfree(iov);
	} else
		res =3D blk_rq_map_user(q, rq, md, hp->dxferp,
				      hp->dxfer_len, GFP_ATOMIC);

	if (!res) {
		srp->bio =3D rq->bio;

		if (!md) {
			req_schp->dio_in_use =3D 1;
			hp->info |=3D SG_INFO_DIRECT_IO;
		}
	}
	return res;
}

static int
sg_finish_rem_req(Sg_request *srp)
{
	int ret =3D 0;

	Sg_fd *sfp =3D srp->parentfp;
	Sg_scatter_hold *req_schp =3D &srp->data;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
				      "sg_finish_rem_req: res_used=3D%d\n",
				      (int) srp->res_used));
	if (srp->bio)
		ret =3D blk_rq_unmap_user(srp->bio);

	if (srp->rq) {
		scsi_req_free_cmd(scsi_req(srp->rq));
		blk_put_request(srp->rq);
	}

	if (srp->res_used)
		sg_unlink_reserve(sfp, srp);
	else
		sg_remove_scat(sfp, req_schp);

	return ret;
}

static int
sg_build_sgat(Sg_scatter_hold * schp, const Sg_fd * sfp, int tablesize)
{
	int sg_bufflen =3D tablesize * sizeof(struct page *);
	gfp_t gfp_flags =3D GFP_ATOMIC | __GFP_NOWARN;

	schp->pages =3D kzalloc(sg_bufflen, gfp_flags);
	if (!schp->pages)
		return -ENOMEM;
	schp->sglist_len =3D sg_bufflen;
	return tablesize;	/* number of scat_gath elements allocated */
}

static int
sg_build_indirect(Sg_scatter_hold * schp, Sg_fd * sfp, int buff_size)
{
	int ret_sz =3D 0, i, k, rem_sz, num, mx_sc_elems;
	int sg_tablesize =3D sfp->parentdp->sg_tablesize;
	int blk_size =3D buff_size, order;
	gfp_t gfp_mask =3D GFP_ATOMIC | __GFP_COMP | __GFP_NOWARN | __GFP_ZERO;
	struct sg_device *sdp =3D sfp->parentdp;

	if (blk_size < 0)
		return -EFAULT;
	if (0 =3D=3D blk_size)
		++blk_size;	/* don't know why */
	/* round request up to next highest SG_SECTOR_SZ byte boundary */
	blk_size =3D ALIGN(blk_size, SG_SECTOR_SZ);
	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
		"sg_build_indirect: buff_size=3D%d, blk_size=3D%d\n",
		buff_size, blk_size));

	/* N.B. ret_sz carried into this block ... */
	mx_sc_elems =3D sg_build_sgat(schp, sfp, sg_tablesize);
	if (mx_sc_elems < 0)
		return mx_sc_elems;	/* most likely -ENOMEM */

	num =3D scatter_elem_sz;
	if (unlikely(num !=3D scatter_elem_sz_prev)) {
		if (num < PAGE_SIZE) {
			scatter_elem_sz =3D PAGE_SIZE;
			scatter_elem_sz_prev =3D PAGE_SIZE;
		} else
			scatter_elem_sz_prev =3D num;
	}

	if (sdp->device->host->unchecked_isa_dma)
		gfp_mask |=3D GFP_DMA;

	order =3D get_order(num);
retry:
	ret_sz =3D 1 << (PAGE_SHIFT + order);

	for (k =3D 0, rem_sz =3D blk_size; rem_sz > 0 && k < mx_sc_elems;
	     k++, rem_sz -=3D ret_sz) {

		num =3D (rem_sz > scatter_elem_sz_prev) ?
			scatter_elem_sz_prev : rem_sz;

		schp->pages[k] =3D alloc_pages(gfp_mask, order);
		if (!schp->pages[k])
			goto out;

		if (num =3D=3D scatter_elem_sz_prev) {
			if (unlikely(ret_sz > scatter_elem_sz_prev)) {
				scatter_elem_sz =3D ret_sz;
				scatter_elem_sz_prev =3D ret_sz;
			}
		}

		SCSI_LOG_TIMEOUT(5, sg_printk(KERN_INFO, sfp->parentdp,
				 "sg_build_indirect: k=3D%d, num=3D%d, ret_sz=3D%d\n",
				 k, num, ret_sz));
	}		/* end of for loop */

	schp->page_order =3D order;
	schp->k_use_sg =3D k;
	SCSI_LOG_TIMEOUT(5, sg_printk(KERN_INFO, sfp->parentdp,
			 "sg_build_indirect: k_use_sg=3D%d, rem_sz=3D%d\n",
			 k, rem_sz));

	schp->bufflen =3D blk_size;
	if (rem_sz > 0)	/* must have failed */
		return -ENOMEM;
	return 0;
out:
	for (i =3D 0; i < k; i++)
		__free_pages(schp->pages[i], order);

	if (--order >=3D 0)
		goto retry;

	return -ENOMEM;
}

static void
sg_remove_scat(Sg_fd * sfp, Sg_scatter_hold * schp)
{
	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
			 "sg_remove_scat: k_use_sg=3D%d\n", schp->k_use_sg));
	if (schp->pages && schp->sglist_len > 0) {
		if (!schp->dio_in_use) {
			int k;

			for (k =3D 0; k < schp->k_use_sg && schp->pages[k]; k++) {
				SCSI_LOG_TIMEOUT(5,
					sg_printk(KERN_INFO, sfp->parentdp,
					"sg_remove_scat: k=3D%d, pg=3D0x%p\n",
					k, schp->pages[k]));
				__free_pages(schp->pages[k], schp->page_order);
			}

			kfree(schp->pages);
		}
	}
	memset(schp, 0, sizeof (*schp));
}

static int
sg_read_oxfer(Sg_request * srp, char __user *outp, int num_read_xfer)
{
	Sg_scatter_hold *schp =3D &srp->data;
	int k, num;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, srp->parentfp->parentdp,
			 "sg_read_oxfer: num_read_xfer=3D%d\n",
			 num_read_xfer));
	if ((!outp) || (num_read_xfer <=3D 0))
		return 0;

	num =3D 1 << (PAGE_SHIFT + schp->page_order);
	for (k =3D 0; k < schp->k_use_sg && schp->pages[k]; k++) {
		if (num > num_read_xfer) {
			if (copy_to_user(outp, page_address(schp->pages[k]),
					   num_read_xfer))
				return -EFAULT;
			break;
		} else {
			if (copy_to_user(outp, page_address(schp->pages[k]),
					   num))
				return -EFAULT;
			num_read_xfer -=3D num;
			if (num_read_xfer <=3D 0)
				break;
			outp +=3D num;
		}
	}

	return 0;
}

static void
sg_build_reserve(Sg_fd * sfp, int req_size)
{
	Sg_scatter_hold *schp =3D &sfp->reserve;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
			 "sg_build_reserve: req_size=3D%d\n", req_size));
	do {
		if (req_size < PAGE_SIZE)
			req_size =3D PAGE_SIZE;
		if (0 =3D=3D sg_build_indirect(schp, sfp, req_size))
			return;
		else
			sg_remove_scat(sfp, schp);
		req_size >>=3D 1;	/* divide by 2 */
	} while (req_size > (PAGE_SIZE / 2));
}

static void
sg_link_reserve(Sg_fd * sfp, Sg_request * srp, int size)
{
	Sg_scatter_hold *req_schp =3D &srp->data;
	Sg_scatter_hold *rsv_schp =3D &sfp->reserve;
	int k, num, rem;

	srp->res_used =3D 1;
	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
			 "sg_link_reserve: size=3D%d\n", size));
	rem =3D size;

	num =3D 1 << (PAGE_SHIFT + rsv_schp->page_order);
	for (k =3D 0; k < rsv_schp->k_use_sg; k++) {
		if (rem <=3D num) {
			req_schp->k_use_sg =3D k + 1;
			req_schp->sglist_len =3D rsv_schp->sglist_len;
			req_schp->pages =3D rsv_schp->pages;

			req_schp->bufflen =3D size;
			req_schp->page_order =3D rsv_schp->page_order;
			break;
		} else
			rem -=3D num;
	}

	if (k >=3D rsv_schp->k_use_sg)
		SCSI_LOG_TIMEOUT(1, sg_printk(KERN_INFO, sfp->parentdp,
				 "sg_link_reserve: BAD size\n"));
}

static void
sg_unlink_reserve(Sg_fd * sfp, Sg_request * srp)
{
	Sg_scatter_hold *req_schp =3D &srp->data;

	SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, srp->parentfp->parentdp,
				      "sg_unlink_reserve: req->k_use_sg=3D%d\n",
				      (int) req_schp->k_use_sg));
	req_schp->k_use_sg =3D 0;
	req_schp->bufflen =3D 0;
	req_schp->pages =3D NULL;
	req_schp->page_order =3D 0;
	req_schp->sglist_len =3D 0;
	srp->res_used =3D 0;
	/* Called without mutex lock to avoid deadlock */
	sfp->res_in_use =3D 0;
}

static Sg_request *
sg_get_rq_mark(Sg_fd * sfp, int pack_id)
{
	Sg_request *resp;
	unsigned long iflags;

	write_lock_irqsave(&sfp->rq_list_lock, iflags);
	list_for_each_entry(resp, &sfp->rq_list, entry) {
		/* look for requests that are ready + not SG_IO owned */
		if ((1 =3D=3D resp->done) && (!resp->sg_io_owned) &&
		    ((-1 =3D=3D pack_id) || (resp->header.pack_id =3D=3D pack_id))) {
			resp->done =3D 2;	/* guard against other readers */
			write_unlock_irqrestore(&sfp->rq_list_lock, iflags);
			return resp;
		}
	}
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);
	return NULL;
}

/* always adds to end of list */
static Sg_request *
sg_add_request(Sg_fd * sfp)
{
	int k;
	unsigned long iflags;
	Sg_request *rp =3D sfp->req_arr;

	write_lock_irqsave(&sfp->rq_list_lock, iflags);
	if (!list_empty(&sfp->rq_list)) {
		if (!sfp->cmd_q)
			goto out_unlock;

		for (k =3D 0; k < SG_MAX_QUEUE; ++k, ++rp) {
			if (!rp->parentfp)
				break;
		}
		if (k >=3D SG_MAX_QUEUE)
			goto out_unlock;
	}
	memset(rp, 0, sizeof (Sg_request));
	rp->parentfp =3D sfp;
	rp->header.duration =3D jiffies_to_msecs(jiffies);
	list_add_tail(&rp->entry, &sfp->rq_list);
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);
	return rp;
out_unlock:
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);
	return NULL;
}

/* Return of 1 for found; 0 for not found */
static int
sg_remove_request(Sg_fd * sfp, Sg_request * srp)
{
	unsigned long iflags;
	int res =3D 0;

	if (!sfp || !srp || list_empty(&sfp->rq_list))
		return res;
	write_lock_irqsave(&sfp->rq_list_lock, iflags);
	if (!list_empty(&srp->entry)) {
		list_del(&srp->entry);
		srp->parentfp =3D NULL;
		res =3D 1;
	}
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);
	return res;
}

static Sg_fd *
sg_add_sfp(Sg_device * sdp)
{
	Sg_fd *sfp;
	unsigned long iflags;
	int bufflen;

	sfp =3D kzalloc(sizeof(*sfp), GFP_ATOMIC | __GFP_NOWARN);
	if (!sfp)
		return ERR_PTR(-ENOMEM);

	init_waitqueue_head(&sfp->read_wait);
	rwlock_init(&sfp->rq_list_lock);
	INIT_LIST_HEAD(&sfp->rq_list);
	kref_init(&sfp->f_ref);
	mutex_init(&sfp->f_mutex);
	sfp->timeout =3D SG_DEFAULT_TIMEOUT;
	sfp->timeout_user =3D SG_DEFAULT_TIMEOUT_USER;
	sfp->force_packid =3D SG_DEF_FORCE_PACK_ID;
	sfp->cmd_q =3D SG_DEF_COMMAND_Q;
	sfp->keep_orphan =3D SG_DEF_KEEP_ORPHAN;
	sfp->parentdp =3D sdp;
	write_lock_irqsave(&sdp->sfd_lock, iflags);
	if (atomic_read(&sdp->detaching)) {
		write_unlock_irqrestore(&sdp->sfd_lock, iflags);
		kfree(sfp);
		return ERR_PTR(-ENODEV);
	}
	list_add_tail(&sfp->sfd_siblings, &sdp->sfds);
	write_unlock_irqrestore(&sdp->sfd_lock, iflags);
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_add_sfp: sfp=3D0x%p\n", sfp));
	if (unlikely(sg_big_buff !=3D def_reserved_size))
		sg_big_buff =3D def_reserved_size;

	bufflen =3D min_t(int, sg_big_buff,
			max_sectors_bytes(sdp->device->request_queue));
	sg_build_reserve(sfp, bufflen);
	SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sdp,
				      "sg_add_sfp: bufflen=3D%d, k_use_sg=3D%d\n",
				      sfp->reserve.bufflen,
				      sfp->reserve.k_use_sg));

	kref_get(&sdp->d_ref);
	__module_get(THIS_MODULE);
	return sfp;
}

static void
sg_remove_sfp_usercontext(struct work_struct *work)
{
	struct sg_fd *sfp =3D container_of(work, struct sg_fd, ew.work);
	struct sg_device *sdp =3D sfp->parentdp;
	Sg_request *srp;
	unsigned long iflags;

	/* Cleanup any responses which were never read(). */
	write_lock_irqsave(&sfp->rq_list_lock, iflags);
	while (!list_empty(&sfp->rq_list)) {
		srp =3D list_first_entry(&sfp->rq_list, Sg_request, entry);
		sg_finish_rem_req(srp);
		list_del(&srp->entry);
		srp->parentfp =3D NULL;
	}
	write_unlock_irqrestore(&sfp->rq_list_lock, iflags);

	if (sfp->reserve.bufflen > 0) {
		SCSI_LOG_TIMEOUT(6, sg_printk(KERN_INFO, sdp,
				"sg_remove_sfp:    bufflen=3D%d, k_use_sg=3D%d\n",
				(int) sfp->reserve.bufflen,
				(int) sfp->reserve.k_use_sg));
		sg_remove_scat(sfp, &sfp->reserve);
	}

	SCSI_LOG_TIMEOUT(6, sg_printk(KERN_INFO, sdp,
			"sg_remove_sfp: sfp=3D0x%p\n", sfp));
	kfree(sfp);

	scsi_device_put(sdp->device);
	kref_put(&sdp->d_ref, sg_device_destroy);
	module_put(THIS_MODULE);
}

static void
sg_remove_sfp(struct kref *kref)
{
	struct sg_fd *sfp =3D container_of(kref, struct sg_fd, f_ref);
	struct sg_device *sdp =3D sfp->parentdp;
	unsigned long iflags;

	write_lock_irqsave(&sdp->sfd_lock, iflags);
	list_del(&sfp->sfd_siblings);
	write_unlock_irqrestore(&sdp->sfd_lock, iflags);

	INIT_WORK(&sfp->ew.work, sg_remove_sfp_usercontext);
	schedule_work(&sfp->ew.work);
}

#ifdef CONFIG_SCSI_PROC_FS
static int
sg_idr_max_id(int id, void *p, void *data)
{
	int *k =3D data;

	if (*k < id)
		*k =3D id;

	return 0;
}

static int
sg_last_dev(void)
{
	int k =3D -1;
	unsigned long iflags;

	read_lock_irqsave(&sg_index_lock, iflags);
	idr_for_each(&sg_index_idr, sg_idr_max_id, &k);
	read_unlock_irqrestore(&sg_index_lock, iflags);
	return k + 1;		/* origin 1 */
}
#endif

/* must be called with sg_index_lock held */
static Sg_device *sg_lookup_dev(int dev)
{
	return idr_find(&sg_index_idr, dev);
}

static Sg_device *
sg_get_dev(int dev)
{
	struct sg_device *sdp;
	unsigned long flags;

	read_lock_irqsave(&sg_index_lock, flags);
	sdp =3D sg_lookup_dev(dev);
	if (!sdp)
		sdp =3D ERR_PTR(-ENXIO);
	else if (atomic_read(&sdp->detaching)) {
		/* If sdp->detaching, then the refcount may already be 0, in
		 * which case it would be a bug to do kref_get().
		 */
		sdp =3D ERR_PTR(-ENODEV);
	} else
		kref_get(&sdp->d_ref);
	read_unlock_irqrestore(&sg_index_lock, flags);

	return sdp;
}

#ifdef CONFIG_SCSI_PROC_FS
static int sg_proc_seq_show_int(struct seq_file *s, void *v);

static int sg_proc_single_open_adio(struct inode *inode, struct file *file);
static ssize_t sg_proc_write_adio(struct file *filp, const char __user *buf=
fer,
			          size_t count, loff_t *off);
static const struct file_operations adio_fops =3D {
	.owner =3D THIS_MODULE,
	.open =3D sg_proc_single_open_adio,
	.read =3D seq_read,
	.llseek =3D seq_lseek,
	.write =3D sg_proc_write_adio,
	.release =3D single_release,
};

static int sg_proc_single_open_dressz(struct inode *inode, struct file *fil=
e);
static ssize_t sg_proc_write_dressz(struct file *filp,=20
		const char __user *buffer, size_t count, loff_t *off);
static const struct file_operations dressz_fops =3D {
	.owner =3D THIS_MODULE,
	.open =3D sg_proc_single_open_dressz,
	.read =3D seq_read,
	.llseek =3D seq_lseek,
	.write =3D sg_proc_write_dressz,
	.release =3D single_release,
};

static int sg_proc_seq_show_version(struct seq_file *s, void *v);
static int sg_proc_seq_show_devhdr(struct seq_file *s, void *v);
static int sg_proc_seq_show_dev(struct seq_file *s, void *v);
static void * dev_seq_start(struct seq_file *s, loff_t *pos);
static void * dev_seq_next(struct seq_file *s, void *v, loff_t *pos);
static void dev_seq_stop(struct seq_file *s, void *v);
static const struct seq_operations dev_seq_ops =3D {
	.start =3D dev_seq_start,
	.next  =3D dev_seq_next,
	.stop  =3D dev_seq_stop,
	.show  =3D sg_proc_seq_show_dev,
};

static int sg_proc_seq_show_devstrs(struct seq_file *s, void *v);
static const struct seq_operations devstrs_seq_ops =3D {
	.start =3D dev_seq_start,
	.next  =3D dev_seq_next,
	.stop  =3D dev_seq_stop,
	.show  =3D sg_proc_seq_show_devstrs,
};

static int sg_proc_seq_show_debug(struct seq_file *s, void *v);
static const struct seq_operations debug_seq_ops =3D {
	.start =3D dev_seq_start,
	.next  =3D dev_seq_next,
	.stop  =3D dev_seq_stop,
	.show  =3D sg_proc_seq_show_debug,
};

static int
sg_proc_init(void)
{
	struct proc_dir_entry *p;

	p =3D proc_mkdir("scsi/sg", NULL);
	if (!p)
		return 1;

	proc_create("allow_dio", S_IRUGO | S_IWUSR, p, &adio_fops);
	proc_create_seq("debug", S_IRUGO, p, &debug_seq_ops);
	proc_create("def_reserved_size", S_IRUGO | S_IWUSR, p, &dressz_fops);
	proc_create_single("device_hdr", S_IRUGO, p, sg_proc_seq_show_devhdr);
	proc_create_seq("devices", S_IRUGO, p, &dev_seq_ops);
	proc_create_seq("device_strs", S_IRUGO, p, &devstrs_seq_ops);
	proc_create_single("version", S_IRUGO, p, sg_proc_seq_show_version);
	return 0;
}


static int sg_proc_seq_show_int(struct seq_file *s, void *v)
{
	seq_printf(s, "%d\n", *((int *)s->private));
	return 0;
}

static int sg_proc_single_open_adio(struct inode *inode, struct file *file)
{
	return single_open(file, sg_proc_seq_show_int, &sg_allow_dio);
}

static ssize_t=20
sg_proc_write_adio(struct file *filp, const char __user *buffer,
		   size_t count, loff_t *off)
{
	int err;
	unsigned long num;

	if (!capable(CAP_SYS_ADMIN) || !capable(CAP_SYS_RAWIO))
		return -EACCES;
	err =3D kstrtoul_from_user(buffer, count, 0, &num);
	if (err)
		return err;
	sg_allow_dio =3D num ? 1 : 0;
	return count;
}

static int sg_proc_single_open_dressz(struct inode *inode, struct file *fil=
e)
{
	return single_open(file, sg_proc_seq_show_int, &sg_big_buff);
}

static ssize_t=20
sg_proc_write_dressz(struct file *filp, const char __user *buffer,
		     size_t count, loff_t *off)
{
	int err;
	unsigned long k =3D ULONG_MAX;

	if (!capable(CAP_SYS_ADMIN) || !capable(CAP_SYS_RAWIO))
		return -EACCES;

	err =3D kstrtoul_from_user(buffer, count, 0, &k);
	if (err)
		return err;
	if (k <=3D 1048576) {	/* limit "big buff" to 1 MB */
		sg_big_buff =3D k;
		return count;
	}
	return -ERANGE;
}

static int sg_proc_seq_show_version(struct seq_file *s, void *v)
{
	seq_printf(s, "%d\t%s [%s]\n", sg_version_num, SG_VERSION_STR,
		   sg_version_date);
	return 0;
}

static int sg_proc_seq_show_devhdr(struct seq_file *s, void *v)
{
	seq_puts(s, "host\tchan\tid\tlun\ttype\topens\tqdepth\tbusy\tonline\n");
	return 0;
}

struct sg_proc_deviter {
	loff_t	index;
	size_t	max;
};

static void * dev_seq_start(struct seq_file *s, loff_t *pos)
{
	struct sg_proc_deviter * it =3D kmalloc(sizeof(*it), GFP_KERNEL);

	s->private =3D it;
	if (! it)
		return NULL;

	it->index =3D *pos;
	it->max =3D sg_last_dev();
	if (it->index >=3D it->max)
		return NULL;
	return it;
}

static void * dev_seq_next(struct seq_file *s, void *v, loff_t *pos)
{
	struct sg_proc_deviter * it =3D s->private;

	*pos =3D ++it->index;
	return (it->index < it->max) ? it : NULL;
}

static void dev_seq_stop(struct seq_file *s, void *v)
{
	kfree(s->private);
}

static int sg_proc_seq_show_dev(struct seq_file *s, void *v)
{
	struct sg_proc_deviter * it =3D (struct sg_proc_deviter *) v;
	Sg_device *sdp;
	struct scsi_device *scsidp;
	unsigned long iflags;

	read_lock_irqsave(&sg_index_lock, iflags);
	sdp =3D it ? sg_lookup_dev(it->index) : NULL;
	if ((NULL =3D=3D sdp) || (NULL =3D=3D sdp->device) ||
	    (atomic_read(&sdp->detaching)))
		seq_puts(s, "-1\t-1\t-1\t-1\t-1\t-1\t-1\t-1\t-1\n");
	else {
		scsidp =3D sdp->device;
		seq_printf(s, "%d\t%d\t%d\t%llu\t%d\t%d\t%d\t%d\t%d\n",
			      scsidp->host->host_no, scsidp->channel,
			      scsidp->id, scsidp->lun, (int) scsidp->type,
			      1,
			      (int) scsidp->queue_depth,
			      (int) atomic_read(&scsidp->device_busy),
			      (int) scsi_device_online(scsidp));
	}
	read_unlock_irqrestore(&sg_index_lock, iflags);
	return 0;
}

static int sg_proc_seq_show_devstrs(struct seq_file *s, void *v)
{
	struct sg_proc_deviter * it =3D (struct sg_proc_deviter *) v;
	Sg_device *sdp;
	struct scsi_device *scsidp;
	unsigned long iflags;

	read_lock_irqsave(&sg_index_lock, iflags);
	sdp =3D it ? sg_lookup_dev(it->index) : NULL;
	scsidp =3D sdp ? sdp->device : NULL;
	if (sdp && scsidp && (!atomic_read(&sdp->detaching)))
		seq_printf(s, "%8.8s\t%16.16s\t%4.4s\n",
			   scsidp->vendor, scsidp->model, scsidp->rev);
	else
		seq_puts(s, "<no active device>\n");
	read_unlock_irqrestore(&sg_index_lock, iflags);
	return 0;
}

/* must be called while holding sg_index_lock */
static void sg_proc_debug_helper(struct seq_file *s, Sg_device * sdp)
{
	int k, new_interface, blen, usg;
	Sg_request *srp;
	Sg_fd *fp;
	const sg_io_hdr_t *hp;
	const char * cp;
	unsigned int ms;

	k =3D 0;
	list_for_each_entry(fp, &sdp->sfds, sfd_siblings) {
		k++;
		read_lock(&fp->rq_list_lock); /* irqs already disabled */
		seq_printf(s, "   FD(%d): timeout=3D%dms bufflen=3D%d "
			   "(res)sgat=3D%d low_dma=3D%d\n", k,
			   jiffies_to_msecs(fp->timeout),
			   fp->reserve.bufflen,
			   (int) fp->reserve.k_use_sg,
			   (int) sdp->device->host->unchecked_isa_dma);
		seq_printf(s, "   cmd_q=3D%d f_packid=3D%d k_orphan=3D%d closed=3D0\n",
			   (int) fp->cmd_q, (int) fp->force_packid,
			   (int) fp->keep_orphan);
		list_for_each_entry(srp, &fp->rq_list, entry) {
			hp =3D &srp->header;
			new_interface =3D (hp->interface_id =3D=3D '\0') ? 0 : 1;
			if (srp->res_used) {
				if (new_interface &&
				    (SG_FLAG_MMAP_IO & hp->flags))
					cp =3D "     mmap>> ";
				else
					cp =3D "     rb>> ";
			} else {
				if (SG_INFO_DIRECT_IO_MASK & hp->info)
					cp =3D "     dio>> ";
				else
					cp =3D "     ";
			}
			seq_puts(s, cp);
			blen =3D srp->data.bufflen;
			usg =3D srp->data.k_use_sg;
			seq_puts(s, srp->done ?
				 ((1 =3D=3D srp->done) ?  "rcv:" : "fin:")
				  : "act:");
			seq_printf(s, " id=3D%d blen=3D%d",
				   srp->header.pack_id, blen);
			if (srp->done)
				seq_printf(s, " dur=3D%d", hp->duration);
			else {
				ms =3D jiffies_to_msecs(jiffies);
				seq_printf(s, " t_o/elap=3D%d/%d",
					(new_interface ? hp->timeout :
						  jiffies_to_msecs(fp->timeout)),
					(ms > hp->duration ? ms - hp->duration : 0));
			}
			seq_printf(s, "ms sgat=3D%d op=3D0x%02x\n", usg,
				   (int) srp->data.cmd_opcode);
		}
		if (list_empty(&fp->rq_list))
			seq_puts(s, "     No requests active\n");
		read_unlock(&fp->rq_list_lock);
	}
}

static int sg_proc_seq_show_debug(struct seq_file *s, void *v)
{
	struct sg_proc_deviter * it =3D (struct sg_proc_deviter *) v;
	Sg_device *sdp;
	unsigned long iflags;

	if (it && (0 =3D=3D it->index))
		seq_printf(s, "max_active_device=3D%d  def_reserved_size=3D%d\n",
			   (int)it->max, sg_big_buff);

	read_lock_irqsave(&sg_index_lock, iflags);
	sdp =3D it ? sg_lookup_dev(it->index) : NULL;
	if (NULL =3D=3D sdp)
		goto skip;
	read_lock(&sdp->sfd_lock);
	if (!list_empty(&sdp->sfds)) {
		seq_printf(s, " >>> device=3D%s ", sdp->disk->disk_name);
		if (atomic_read(&sdp->detaching))
			seq_puts(s, "detaching pending close ");
		else if (sdp->device) {
			struct scsi_device *scsidp =3D sdp->device;

			seq_printf(s, "%d:%d:%d:%llu   em=3D%d",
				   scsidp->host->host_no,
				   scsidp->channel, scsidp->id,
				   scsidp->lun,
				   scsidp->host->hostt->emulated);
		}
		seq_printf(s, " sg_tablesize=3D%d excl=3D%d open_cnt=3D%d\n",
			   sdp->sg_tablesize, sdp->exclude, sdp->open_cnt);
		sg_proc_debug_helper(s, sdp);
	}
	read_unlock(&sdp->sfd_lock);
skip:
	read_unlock_irqrestore(&sg_index_lock, iflags);
	return 0;
}

#endif				/* CONFIG_SCSI_PROC_FS */

module_init(init_sg);
module_exit(exit_sg);

--MP_/DTU6=qRuDnQw7nhGY+1r/Al--

--Sig_/vq/5jtsOIOy.U2Vfd=G1tVg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Dn6UACgkQAVBC80lX
0GzOTQf+MqT9nTzem6THozh/1uJZbG29a28gmhvMrM9krzMDb9hw6QKabZz3Mh7V
q4YupcN0/R8F54FhbRT5ui6l0o5tJmTwVAvsO277HGjvVtcCs8qc53c4+FMs8iil
2LQbTExYyy/4uszPIh3oBCAVaUVoz/XexwJl11d3A/dQ+YWX7o7joqtYF1V+Ba1F
tCNNzd35uw746lE08127Do2DuA94zYp6wnpa48SsvRb3390Rw8BN1IdZhzv+qKaG
gafTnvGxu4caRWtp2VpZF3kFoSg9kL/kqFIpg/oS7huSeAa4FfmWeKiirTiKOs0E
3F8Q40jSsAQUtwAzFVA8M0edgm9pow==
=FQBl
-----END PGP SIGNATURE-----

--Sig_/vq/5jtsOIOy.U2Vfd=G1tVg--
