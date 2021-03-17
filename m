Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EDB33E5B9
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 02:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhCQBIE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 21:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhCQBHB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 21:07:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7091C06174A;
        Tue, 16 Mar 2021 18:06:52 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q25so418666lfc.8;
        Tue, 16 Mar 2021 18:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q+twJT2hc1BLBqdPgL+zxue3qVKW5GprlQ9qXEbSSqE=;
        b=Az2auwf7/Z1ED9pRvGbDwQuUlgNesPHekx0yVBpuS8KaEIxFzbEJJlvEmJtK9v8NTl
         Dcs9VomD2aR0EIwGT459DrjXwBzeuG/e9g6E0p4RuautRJKZiXC1oUDTO/nhrKvjXT+X
         EahVAriOyw1KSWZojJHjXnfCOTfvJIJ5YcC1HlgqqmxfbAyo/Gwt/vM3e+Yz0kXJX/8j
         zbPqWT4lpn4ELLa61LCJqPTgEBUzGc3i0ZSpkretOylVNNnnpupayXVwtzKDmtMIPtHW
         IyuRQslhaThXRcavTYew1o0p0gwxYTo1QUU5vCmfbFtNLi1Sm4nuGQjStPeGjURWkfSg
         0BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q+twJT2hc1BLBqdPgL+zxue3qVKW5GprlQ9qXEbSSqE=;
        b=imBbObhcE/i/Ti5yAZnqsncWIqccXSNIQySyTfIgJpOogBKK3RSZTNShEsm4LU2RCi
         i4uvEuaEhx3bflb6gU+DBhgUYnzywXExS+iG47agU0eSj5aSRoiZi6rETgMdf4Jcm/5s
         xDrAQZWs0BHaH4I8Q1Q7pquMKZgHK0t/PDJir7VO3k93K0iHOCrh3ho3pr1o1SiNGW50
         PKcowESfNNw+fI3HNioya8TQoqU9ItubR4wJzYtteUftvMNFAKaHrWITwNBK7AfJLHXH
         k+YXFddE3Fxou7ZbstjCSsfmmf8+cOwb+yEFBZs+Y5mSMtxAPTkCF4Hw6DTJKpCnbiGT
         Nn/w==
X-Gm-Message-State: AOAM533zptKmXAVFmAOkBMLbxryqFolS6jZvLWDdtb6IXm1RZf4KTb0q
        kGbDZ1W5m7MzgBNqLSghpL19l3RhVXJa8YO+SRk=
X-Google-Smtp-Source: ABdhPJzF+e9/CtrQcvZ7Syc3qEEIrZ1YrANimf+FnpsG0pdFdyF+MkmnOrsxkv3yLemiQpG2TWYO1D9R+aoUJnLhPvs=
X-Received: by 2002:a19:7515:: with SMTP id y21mr846340lfe.282.1615943209810;
 Tue, 16 Mar 2021 18:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210317093729.3cab3f2c@canb.auug.org.au>
In-Reply-To: <20210317093729.3cab3f2c@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Tue, 16 Mar 2021 20:06:39 -0500
Message-ID: <CAH2r5msm0sybKQC1S8TnS9hGt5Om2XwP3oe=3ScoDHV7RyHbeA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the cifsd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Namjae updated/restructured the initial list of patches to be easier
to follow (and also fixed the missing Acked-by and Signed-off-by tags)
- and I have updated the branch.  Let us know if you see other cleanup
that would make this (initial merge) process easier.  I am continuing
to run testing on it, but it is looking promising.

On Tue, Mar 16, 2021 at 5:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   5c6ab7c9c301 ("cifsd: don't clear ATTR_DIRECTORY with ATTR_NORMAL + other bits")
>   37f12f1a9e76 ("cifsd: remove backup file lookup restriction")
>   511fbebc9d3b ("cifsd: fix racy issue between close_id_del_oplock() and destroy_lease_table()")
>   60f4e4de7868 ("cifsd: handle idmapped mounts")
>   8e1b809f11ee ("cifsd: use notify_change in set_file_basic_info()")
>   8c1930014c34 ("cifsd: fix the issue of change the directory to the file")
>   608b7bb0e414 ("cifsd: fix potential use after free in ksmbd_vfs_set_init_posix_acl()")
>   a53327ff87b2 ("cifsd: fix memleak in ksmbd_vfs_set_init_posix_acl()")
>   a98dbc20cbdb ("cifsd: Add missing path_put() calls in smb2_open()")
>   ca46f5254981 ("cifsd: Fix error handling in __ksmbd_vfs_rename")
>   bb932cbbc781 ("cifsd: Do not print timestamp after processing Maximum Access CreateContext")
>   76cd471c09e7 ("cifsd: add v4 dos attribute structure")
>   f2b993deb1cd ("cifsd: fix random failure from smb2.create.multi")
>   01a8bf060081 ("cifsd: fix smb2.lease.statopen3 in smbtorture")
>   534cf891fdd8 ("cifsd: Remove call to ksmbd_revert_fsids() in ksmbd_vfs_mkdir()")
>   3a1bb9e2ccc3 ("cifsd: Make sure ksmbd_override_fsids() is called with Durable Opens")
>   d69623ac1609 ("cifsd: Add missing dput() in process_query_dir_entries()")
>   7caaa1dc0f84 ("cifsd: Fix incorrect error handling in smb2_open()")
>   6b457e969def ("cifsd: handle an error case in extract_last_component")
>   57987aee520c ("cifsd: fix a typo error in the name of a funnction")
>   56f3ac5868fa ("cifsd: fix SMB2_QUERY_MAXIMAL_ACCESS_REQUEST")
>   e36e95b4a918 ("cifsd: implement maximal allowed desired access")
>   1b9f1e136e8b ("cifsd: fix build break with linux-5.11 kernel")
>   4a26a8aa4189 ("cifsd: macros with complex values should be enclosed in parentheses")
>   affbd69c2cb5 ("cifsd: make xattr format of ksmbd compatible with samba's one")
>   b0467288c502 ("cifsd: fix a memleak from netdevice_notifier")
>   1e5eb460e3e7 ("cifsd: Use netdevice_notifier to configure TCP listeners")
>   58dcf3a3aac6 ("cifsd: Change alloc_iface() return type in transport_tcp.c")
>   eaa4fa7ab91d ("cifsd: avoid calling ksmbd_override_fsids recursively")
>   8d1b5f668026 ("cifsd: set supplementary groups when overriding credentials")
>   901ce4507f08 ("cifsd: fix integer overflow issue in ksmbd_vfs_fqar_lseek()")
>   d76abe30e48d ("cifsd: downgrade "unexpected oplock state" to a debug message")
>   f6881be8859a ("cifsd: fix racy access to ksmbd_file")
>   5441ad0cfa45 ("cifsd: prevent ksmbd from sending duplicate oplock break notifications")
>   62a5df744681 ("cifsd: enable SMB_SERVER_CHECK_CAP_NET_ADMIN by default")
>   597357deeecf ("cifsd: update cifsd.rst file")
>   9fe8dd069399 ("cifsd: set SMB2_CLOSE_FLAG_POSTQUERY_ATTRIB flags in smb2 close response if attribute fields are valid")
>   fdcdac101a2d ("cifsd: fill times in SMB2_CLOSE response")
>   1e831f7ccab5 ("cifsd: fix permission denied error when querying dacl")
>   ec03266638d3 ("cifsd: rename FILE_{READ/WRITE}_DESIRED_ACCESS")
>   96f1ad1dccf8 ("cifsd: add support for recognizing WSL reparse tags")
>   e7ffe8d67f4b ("cifsd: set O_PATH to open_flags if desired access is FILE_READ_ATTRIBUTES")
>   c98dcf7abaf6 ("cifsd: fix unlink permission error")
>   4696fa2903b6 ("cifsd: fix stat permission error")
>   ba2513ea3367 ("cifsd: fix invalid open flags")
>   3ed1e35ea23a ("cifsd: wrap vfs acls functions with CONFIG_FS_POSIX_ACL")
>   0460c98d086e ("cifsd: open file with O_NONBLOCK flags by default")
>   8aecd712e0a4 ("cifsd: remove repeated word")
>   0db918db34a4 ("cifsd: replace ENOTSUPP with EOPNOTSUPP")
>   ace29fa5db87 ("cifsd: add missing create posix context in response")
>   3cbb1a2dc880 ("cifsd: add smb2 POSIX query dir")
>   6139ab2e0432 ("cifsd: add support for statfs for smb3.1.1 posix extensions")
>   f49a9cd0596e ("cifsd: add support for query info using posix extensions (level 100)")
>   e19a174afef6 ("cifsd: add SPNEGO-based Kerberos 5 authentication")
>   affb750272ff ("cifsd: add IPC command for authentication")
>   55f9e825b44b ("cifsd: select the preferred authentication mechanism among proposal")
>   ef24dca82789 ("cifsd: add support for ACLs")
>   5c240146de09 ("cifsd: get subauth values generated by ksmbd.mountd")
>   14246142f631 ("cifsd: add support for lsarpc rpc")
>   5b0cebbceca5 ("cifsd: add support for samr rpc")
>   11a01d92f833 ("cifsd: fix racy issue between kill server command and destroy_previous_session()")
>   504e2b3e74e8 ("cifsd: fix wrong goto statement use in smb2_open()")
>   73d8db2f78c9 ("cifsd: Use string functions to copy strings in transport_ipc.c")
>   906acf03d78b ("cifsd: fix suspicious rcu_dereference_check usage warning")
>   04a9683de690 ("cifsd: pass a sockptr_t instead of a plain user pointer into sock_setsockopt()")
>   fa593b54c05d ("cifsd: fix potential null pointer dereferencing error of tfm in alloc_shash_desc()")
>   a740fb3bc1e3 ("cifsd: fix potential overflow issue in ___server_conf_set()")
>   296a653f43ba ("cifsd: don't support FSCTL_VALIDATE_NEGOTIATE_INFO if connect dialect is smaller than SMB3.02")
>   3fc4b2e0a056 ("cifsd: fix auto negotiation failure when setting min/max protocol is higher than SMB 2.0")
>   6ce247bb6eda ("cifsd: sign session setup response on SMB3.0 and SMB3.02")
>   534a0a9ee699 ("cifsd: make 8byte context alignment when there is the next context in negotiate contexts")
>   395772f5f42b ("cifsd: fix null pointer dereferencing error in ->set_sign_rsp()
>   5c6ab7c9c301 ("cifsd: don't clear ATTR_DIRECTORY with ATTR_NORMAL + other bits")
>   37f12f1a9e76 ("cifsd: remove backup file lookup restriction")
>   511fbebc9d3b ("cifsd: fix racy issue between close_id_del_oplock() and destroy_lease_table()")
>   60f4e4de7868 ("cifsd: handle idmapped mounts")
>   8e1b809f11ee ("cifsd: use notify_change in set_file_basic_info()")
>   8c1930014c34 ("cifsd: fix the issue of change the directory to the file")
>   608b7bb0e414 ("cifsd: fix potential use after free in ksmbd_vfs_set_init_posix_acl()")
>   a53327ff87b2 ("cifsd: fix memleak in ksmbd_vfs_set_init_posix_acl()")
>   a98dbc20cbdb ("cifsd: Add missing path_put() calls in smb2_open()")
>   ca46f5254981 ("cifsd: Fix error handling in __ksmbd_vfs_rename")
>   bb932cbbc781 ("cifsd: Do not print timestamp after processing Maximum Access CreateContext")
>   76cd471c09e7 ("cifsd: add v4 dos attribute structure")
>   f2b993deb1cd ("cifsd: fix random failure from smb2.create.multi")
>   01a8bf060081 ("cifsd: fix smb2.lease.statopen3 in smbtorture")
>   534cf891fdd8 ("cifsd: Remove call to ksmbd_revert_fsids() in ksmbd_vfs_mkdir()")
>   3a1bb9e2ccc3 ("cifsd: Make sure ksmbd_override_fsids() is called with DurableOpens")
>   d69623ac1609 ("cifsd: Add missing dput() in process_query_dir_entries()")
>   7caaa1dc0f84 ("cifsd: Fix incorrect error handling in smb2_open()")
>
> are missing a Signed-off-by from their committer.
>
> One of the issues with rebasing ...
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
