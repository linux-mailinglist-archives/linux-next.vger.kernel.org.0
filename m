Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC34210F3E4
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 01:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfLCAYN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 19:24:13 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57066 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfLCAYM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Dec 2019 19:24:12 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB30NSsu181711;
        Tue, 3 Dec 2019 00:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=83ZWSB/F4aobWrW35Kn2gtNTO8nhVBTzO1cE0YooDqs=;
 b=khxpuQC+mKprZAWa3fR2Tte68qeaEZRNaHIKcXwqkU5xeYqtSF6MRUrxS6nBEuslUPHs
 DPMC78GJA6cEOA+6Y0+e+IQR6NB0bRWp3sW0/conYbcjag+UwTEWO3TqjJ67KjF1AFBW
 I+6riZ1OHeutUW0P2WWxa9bTYu4TJCjsRZBhoxtoWyxgoBN8uZgyAHlXk1ryH/mUBVtK
 kCvP1aAS7sMaUmoUjAt2xcVTCz4pcR530iMSp7+kdN/YGw4FkhPNaMEt5xi9fAmyw6xq
 tKSwwYYD/8TmDQs6fYHPD76QJnjoEfJbL9WnWSsLTyeRzxeNyT5v6m91d6PVvDCG6h6i SQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2wkfuu3t82-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Dec 2019 00:23:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB30Nobr072522;
        Tue, 3 Dec 2019 00:23:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2wn8k1cd5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Dec 2019 00:23:54 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xB30Mxoo012861;
        Tue, 3 Dec 2019 00:23:00 GMT
Received: from localhost (/10.159.148.223)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Dec 2019 16:22:59 -0800
Date:   Mon, 2 Dec 2019 16:22:58 -0800
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the y2038 tree with the xfs tree
Message-ID: <20191203002258.GE7339@magnolia>
References: <20191030153046.01efae4a@canb.auug.org.au>
 <20191203110039.2ec22a17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203110039.2ec22a17@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030002
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030002
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 03, 2019 at 11:00:39AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> This conflict is now between the xfs tree and Linus' tree (and the
> merge fix up patch below needs applying to that merge.

There shouldn't be a conflict any more, since Linus just pulled the xfs
tree into master and resolved the conflict in the merge commit.
(Right?  Or am I missing something here post-turkeyweekend? 8))

--D

> On Wed, 30 Oct 2019 15:31:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the y2038 tree got a conflict in:
> > 
> >   fs/compat_ioctl.c
> > 
> > between commit:
> > 
> >   837a6e7f5cdb ("fs: add generic UNRESVSP and ZERO_RANGE ioctl handlers")
> > 
> > from the xfs tree and commits:
> >   011da44bc5b6 ("compat: move FS_IOC_RESVSP_32 handling to fs/ioctl.c")
> >   37ecf8b20abd ("compat_sys_ioctl(): make parallel to do_vfs_ioctl()")
> > 
> > from the y2038 tree.
> > 
> > I fixed it up (see below and the added patch) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> > 
> > From af387ea192196ffd141234e7e45bcfbc2be1a4fc Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 30 Oct 2019 15:05:29 +1100
> > Subject: [PATCH] fix up for "compat: move FS_IOC_RESVSP_32 handling to
> >  fs/ioctl.c"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/ioctl.c             | 4 ++--
> >  include/linux/falloc.h | 7 +++++--
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > index 455ad38c8610..2f5e4e5b97e1 100644
> > --- a/fs/ioctl.c
> > +++ b/fs/ioctl.c
> > @@ -495,7 +495,7 @@ int ioctl_preallocate(struct file *filp, int mode, void __user *argp)
> >  /* on ia32 l_start is on a 32-bit boundary */
> >  #if defined CONFIG_COMPAT && defined(CONFIG_X86_64)
> >  /* just account for different alignment */
> > -int compat_ioctl_preallocate(struct file *file,
> > +int compat_ioctl_preallocate(struct file *file, int mode,
> >  				struct space_resv_32 __user *argp)
> >  {
> >  	struct inode *inode = file_inode(file);
> > @@ -517,7 +517,7 @@ int compat_ioctl_preallocate(struct file *file,
> >  		return -EINVAL;
> >  	}
> >  
> > -	return vfs_fallocate(file, FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l_len);
> > +	return vfs_fallocate(file, mode | FALLOC_FL_KEEP_SIZE, sr.l_start, sr.l_len);
> >  }
> >  #endif
> >  
> > diff --git a/include/linux/falloc.h b/include/linux/falloc.h
> > index 63c4f0d615bc..ab42b72424f0 100644
> > --- a/include/linux/falloc.h
> > +++ b/include/linux/falloc.h
> > @@ -45,10 +45,13 @@ struct space_resv_32 {
> >  	__s32		l_pad[4];	/* reserve area */
> >  };
> >  
> > -#define FS_IOC_RESVSP_32		_IOW ('X', 40, struct space_resv_32)
> > +#define FS_IOC_RESVSP_32	_IOW ('X', 40, struct space_resv_32)
> > +#define FS_IOC_UNRESVSP_32	_IOW ('X', 41, struct space_resv_32)
> >  #define FS_IOC_RESVSP64_32	_IOW ('X', 42, struct space_resv_32)
> > +#define FS_IOC_UNRESVSP64_32	_IOW ('X', 43, struct space_resv_32)
> > +#define FS_IOC_ZERO_RANGE_32	_IOW ('X', 57, struct space_resv_32)
> >  
> > -int compat_ioctl_preallocate(struct file *, struct space_resv_32 __user *);
> > +int compat_ioctl_preallocate(struct file *, int mode, struct space_resv_32 __user *);
> >  
> >  #endif
> >  
> > -- 
> > 2.23.0
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc fs/compat_ioctl.c
> > index 62e530814cef,9ae90d728c0f..000000000000
> > --- a/fs/compat_ioctl.c
> > +++ b/fs/compat_ioctl.c
> > @@@ -1020,51 -165,38 +165,57 @@@ COMPAT_SYSCALL_DEFINE3(ioctl, unsigned 
> >   	case FIONBIO:
> >   	case FIOASYNC:
> >   	case FIOQSIZE:
> > - 		break;
> > - 
> > - #if defined(CONFIG_IA64) || defined(CONFIG_X86_64)
> > + 	case FS_IOC_FIEMAP:
> > + 	case FIGETBSZ:
> > + 	case FICLONERANGE:
> > + 	case FIDEDUPERANGE:
> > + 		goto found_handler;
> > + 	/*
> > + 	 * The next group is the stuff handled inside file_ioctl().
> > + 	 * For regular files these never reach ->ioctl(); for
> > + 	 * devices, sockets, etc. they do and one (FIONREAD) is
> > + 	 * even accepted in some cases.  In all those cases
> > + 	 * argument has the same type, so we can handle these
> > + 	 * here, shunting them towards do_vfs_ioctl().
> > + 	 * ->compat_ioctl() will never see any of those.
> > + 	 */
> > + 	/* pointer argument, never actually handled by ->ioctl() */
> > + 	case FIBMAP:
> > + 		goto found_handler;
> > + 	/* handled by some ->ioctl(); always a pointer to int */
> > + 	case FIONREAD:
> > + 		goto found_handler;
> > + 	/* these two get messy on amd64 due to alignment differences */
> > + #if defined(CONFIG_X86_64)
> >   	case FS_IOC_RESVSP_32:
> >   	case FS_IOC_RESVSP64_32:
> >  -		error = compat_ioctl_preallocate(f.file, compat_ptr(arg));
> >  +		error = compat_ioctl_preallocate(f.file, 0, compat_ptr(arg));
> >  +		goto out_fput;
> >  +	case FS_IOC_UNRESVSP_32:
> >  +	case FS_IOC_UNRESVSP64_32:
> >  +		error = compat_ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
> >  +				compat_ptr(arg));
> >  +		goto out_fput;
> >  +	case FS_IOC_ZERO_RANGE_32:
> >  +		error = compat_ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
> >  +				compat_ptr(arg));
> >   		goto out_fput;
> >   #else
> >   	case FS_IOC_RESVSP:
> >   	case FS_IOC_RESVSP64:
> >  -		goto found_handler;
> >  +		error = ioctl_preallocate(f.file, 0, compat_ptr(arg));
> >  +		goto out_fput;
> >  +	case FS_IOC_UNRESVSP:
> >  +	case FS_IOC_UNRESVSP64:
> >  +		error = ioctl_preallocate(f.file, FALLOC_FL_PUNCH_HOLE,
> >  +				compat_ptr(arg));
> >  +		goto out_fput;
> >  +	case FS_IOC_ZERO_RANGE:
> >  +		error = ioctl_preallocate(f.file, FALLOC_FL_ZERO_RANGE,
> >  +				compat_ptr(arg));
> >  +		goto out_fput;
> >   #endif
> >   
> > - 	case FICLONE:
> > - 	case FICLONERANGE:
> > - 	case FIDEDUPERANGE:
> > - 	case FS_IOC_FIEMAP:
> > - 		goto do_ioctl;
> > - 
> > - 	case FIBMAP:
> > - 	case FIGETBSZ:
> > - 	case FIONREAD:
> > - 		if (S_ISREG(file_inode(f.file)->i_mode))
> > - 			break;
> > - 		/*FALL THROUGH*/
> > - 
> >   	default:
> >   		if (f.file->f_op->compat_ioctl) {
> >   			error = f.file->f_op->compat_ioctl(f.file, cmd, arg);
> 
> -- 
> Cheers,
> Stephen Rothwell


