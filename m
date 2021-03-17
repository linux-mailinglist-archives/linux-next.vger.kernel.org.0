Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFB133EB4E
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 09:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCQIUa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 04:20:30 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:64096 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCQIT7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 04:19:59 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210317081957epoutp047d1f76f38fe15e1c1c3cb3b1f305b33c~tE2xahzOO2027520275epoutp04N
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 08:19:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210317081957epoutp047d1f76f38fe15e1c1c3cb3b1f305b33c~tE2xahzOO2027520275epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615969197;
        bh=Bv/EFfWE+puusroAlcqpWgt+UhZO+IvyUhmVXgnNYjk=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=n+HxOGrCMPGABfk3K56S2eV09I3g/QrL1IN94DRhzH/HlRQGtJ+PeFceP81h99eEV
         2Qo6Wj2habckmwOMvwhZ/9pBXRVKMl/fu9m21D/R4Ne6Fh/SIjh6oKOszL3Rj4yDBI
         FaPC2C0ooQXr6gnWKxpJNFx1q7L40RB19OnNMGiY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210317081956epcas1p38b78090fc23361251e43b311b9e674a7~tE2w6z-Pm2203222032epcas1p3p;
        Wed, 17 Mar 2021 08:19:56 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.161]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4F0jkg11mgz4x9QG; Wed, 17 Mar
        2021 08:19:55 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CC.99.63458.AABB1506; Wed, 17 Mar 2021 17:19:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20210317081954epcas1p3672550a23c7e8497193f0c0abccadc4a~tE2uTLfGK2203222032epcas1p3g;
        Wed, 17 Mar 2021 08:19:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210317081954epsmtrp2e07c49f96d74c101374a93b6bb02dd26~tE2uSVddD2727527275epsmtrp21;
        Wed, 17 Mar 2021 08:19:54 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-19-6051bbaa08f4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        5D.77.13470.9ABB1506; Wed, 17 Mar 2021 17:19:53 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210317081953epsmtip23e57212288257db267db96c1691cc9e0~tE2uDMNF82036920369epsmtip2T;
        Wed, 17 Mar 2021 08:19:53 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Steve French'" <smfrench@gmail.com>
Cc:     "'Steve French'" <stfrench@microsoft.com>,
        "'Hyunchul Lee'" <hyc.lee@gmail.com>,
        "'Sergey Senozhatsky'" <sergey.senozhatsky@gmail.com>,
        "'Ronnie Sahlberg'" <lsahlber@redhat.com>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>
In-Reply-To: <20210317185304.6b92290c@canb.auug.org.au>
Subject: RE: linux-next: build failure after merge of the cifsd tree
Date:   Wed, 17 Mar 2021 17:19:53 +0900
Message-ID: <012901d71b06$4ef96580$ecec3080$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIP095xjs+vlNQ4lY6ZrP7aDK52EAII8HCFqgYdDsA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmge6q3YEJBoseallcu/+e3eLyrjls
        FgcXtjFaLLiqb7H282N2i617r7JbvHlxmM3i1sT5bA4cHo03brB57Jx1l92jdcdfdo/3+66y
        eXzeJBfAGpVjk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuW
        mQN0ipJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwNCgQK84Mbe4NC9dLzk/18rQ
        wMDIFKgyISdj0VaughuSFVM2bmNpYJwp2sXIySEhYCJxdvskxi5GLg4hgR2MElcuPGCBcD4x
        Shxu3QqV+cYo8aRnEztMy+5dy1lAbCGBvYwSM+6FQxS9ZJS4vGkLK0iCTUBX4t+f/WwgtohA
        hMT5hr1gY5kFtjJJbP3wACjBwcEpYC6xdU8oiCks4CKxZFMEiMkioCpx8YMGSCevgKXEj8PP
        WCBsQYmTM5+A2cwC8hLb385hhjhHQeLn02WsEJusJA5u62SDqBGRmN3ZxgyyVUJgIYfEgUfr
        oO53kfh4/SUrhC0s8er4Fqi4lMTnd3vBLpMQqJb4uB9qfgejxIvvthC2scTN9RtYQUqYBTQl
        1u/ShwgrSuz8PZcRYi2fxLuvPawQU3glOtqEIEpUJfouHWaCsKUluto/sE9gVJqF5LFZSB6b
        heSBWQjLFjCyrGIUSy0ozk1PLTYsMEKO6E2M4CSqZbaDcdLbD3qHGJk4GA8xSnAwK4nwmuYF
        JAjxpiRWVqUW5ccXleakFh9iNAWG9ERmKdHkfGAazyuJNzQ1MjY2tjAxMzczNVYS5000eBAv
        JJCeWJKanZpakFoE08fEwSnVwKSefalX8tpii7wNJ1avuJet88C1MeTL2uDYi7e3O9ze9NR0
        sYGuaZBRzvkln1vCf/F8uGk86Zlvyk8ff7X3xatcRNYy3S0L37PXQ/Tz6dSDXhwz175jqfyv
        Ybw+IS/hUIYn+1q70L6q2I+bvv1eurYjP/LhnDMvZmY7r46/vED3wSuZKUq2MzVulggrSc2O
        23xhnVrzs4apE2REpJK2VSpZGphPXq/jI6PrOWmqzdwFxziaF99+EKbxcrNgycoPiTp6955P
        Eprbqcuyj40pyKlzx2NF1YInq1/9W5zvFt7M2229M2dTwIqitZ16GufjlzrOq2l78kzp0axV
        ZS8OmtXPqBffZz1f5+zXHaVRCXeUWIozEg21mIuKEwG3IPY6KwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42LZdlhJXnfl7sAEg7kvTC2u3X/PbnF51xw2
        i4ML2xgtFlzVt1j7+TG7xda9V9kt3rw4zGZxa+J8NgcOj8YbN9g8ds66y+7RuuMvu8f7fVfZ
        PD5vkgtgjeKySUnNySxLLdK3S+DKWLSVq+CGZMWUjdtYGhhninYxcnJICJhI7N61nKWLkYtD
        SGA3o8TRrdtYIBLSEsdOnGHuYuQAsoUlDh8uhqh5zijx9MEuVpAaNgFdiX9/9rOB2CICERJr
        +x6yghQxC2xnkvh87wUTREcHo8SL2+1gkzgFzCW27gkFMYUFXCSWbIoAMVkEVCUuftAAGcMr
        YCnx4/AzFghbUOLkzCcsICXMAnoSbRsZQcLMAvIS29/OYYa4UkHi59NlrBAXWEkc3NbJBlEj
        IjG7s415AqPwLCSTZiFMmoVk0iwkHQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+du
        YgRHk5bmDsbtqz7oHWJk4mA8xCjBwawkwmuaF5AgxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC
        18l4IYH0xJLU7NTUgtQimCwTB6dUA1PQ//ffLu9YJXx2/xJeU5HuPsGowNvb101sYbna/VN2
        hs2WhesYU61Sa82lL8b90fXomHxq6fSbvM2ze7L2nrl06l3fnWOXGeqPvp4yMfRyldl6H9ZZ
        /wJS8qUVPjV+EZpTH65UkqyRZcu1Kf+f/q9cx7DU9/62rjXn7KaIL0n/U/78o67ik1XsDdlP
        Eo6ypRy//X7CkTsR0xQyfoudyNstrxtrNilRTmzOFPF58+pZGxMKup9tbkw2u7tkJoPAyc0f
        7R91BLFUXD0TqrS1PIn7r07igd0VIq4cn9eaqjWuOhViEmttu8g3z/mCu3BWVs2brtWrN553
        uZ46L3z66h1v1s7/rlq2fZ9huLhn2B8lluKMREMt5qLiRADEevCkFQMAAA==
X-CMS-MailID: 20210317081954epcas1p3672550a23c7e8497193f0c0abccadc4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210317075311epcas1p495b35e81ffa13c1ab7319cb910d6e23e
References: <CGME20210317075311epcas1p495b35e81ffa13c1ab7319cb910d6e23e@epcas1p4.samsung.com>
        <20210317185304.6b92290c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,
> Hi all,
> 
> After merging the cifsd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: fs/cifsd/misc.o:(.opd+0xc0): multiple definition of `extract_sharename'; fs/cifs/unc.o:(.opd+0x18):
> first defined here
> ld: fs/cifsd/misc.o: in function `.extract_sharename':
> misc.c:(.text.extract_sharename+0x0): multiple definition of `.extract_sharename';
> fs/cifs/unc.o:unc.c:(.text.extract_sharename+0x0): first defined here
> 
> Caused by commit
> 
>   cabcebc31de4 ("cifsd: introduce SMB3 kernel server")
> 
> I applied the following patch for today:
I send a pull request included this patch to Steve.

Thanks for your patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 17 Mar 2021 18:35:55 +1100
> Subject: [PATCH] cifsd: uniquify extract_sharename()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/cifsd/misc.c    | 4 ++--
>  fs/cifsd/misc.h    | 2 +-
>  fs/cifsd/smb2pdu.c | 2 +-
>  fs/cifsd/unicode.h | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/cifsd/misc.c b/fs/cifsd/misc.c index 9e689c33f7bb..2e83cfc43be9 100644
> --- a/fs/cifsd/misc.c
> +++ b/fs/cifsd/misc.c
> @@ -210,12 +210,12 @@ void ksmbd_conv_path_to_windows(char *path)  }
> 
>  /**
> - * extract_sharename() - get share name from tree connect request
> + * cifsd_extract_sharename() - get share name from tree connect request
>   * @treename:	buffer containing tree name and share name
>   *
>   * Return:      share name on success, otherwise error
>   */
> -char *extract_sharename(char *treename)
> +char *cifsd_extract_sharename(char *treename)
>  {
>  	char *name = treename;
>  	char *dst;
> diff --git a/fs/cifsd/misc.h b/fs/cifsd/misc.h index d67843aad509..4cb0d4bebb21 100644
> --- a/fs/cifsd/misc.h
> +++ b/fs/cifsd/misc.h
> @@ -25,7 +25,7 @@ void ksmbd_conv_path_to_unix(char *path);  void ksmbd_strip_last_slash(char *path);
> void ksmbd_conv_path_to_windows(char *path);
> 
> -char *extract_sharename(char *treename);
> +char *cifsd_extract_sharename(char *treename);
> 
>  char *convert_to_unix_name(struct ksmbd_share_config *share, char *name);
> 
> diff --git a/fs/cifsd/smb2pdu.c b/fs/cifsd/smb2pdu.c index b20cc07ee809..3da96ebeae8b 100644
> --- a/fs/cifsd/smb2pdu.c
> +++ b/fs/cifsd/smb2pdu.c
> @@ -1709,7 +1709,7 @@ int smb2_tree_connect(struct ksmbd_work *work)
>  		goto out_err1;
>  	}
> 
> -	name = extract_sharename(treename);
> +	name = cifsd_extract_sharename(treename);
>  	if (IS_ERR(name)) {
>  		status.ret = KSMBD_TREE_CONN_STATUS_ERROR;
>  		goto out_err1;
> diff --git a/fs/cifsd/unicode.h b/fs/cifsd/unicode.h index 228a02c9b95d..16269c098f86 100644
> --- a/fs/cifsd/unicode.h
> +++ b/fs/cifsd/unicode.h
> @@ -69,7 +69,7 @@ char *smb_strndup_from_utf16(const char *src, const int maxlen,
>  		const struct nls_table *codepage);
>  extern int smbConvertToUTF16(__le16 *target, const char *source, int srclen,
>  		const struct nls_table *cp, int mapchars); -extern char *extract_sharename(char
> *treename);
> +extern char *cifsd_extract_sharename(char *treename);
>  #endif
> 
>  wchar_t cifs_toupper(wchar_t in);
> --
> 2.30.0
> 
> --
> Cheers,
> Stephen Rothwell

