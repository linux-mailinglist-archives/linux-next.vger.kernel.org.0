Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B67E7CC6
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfJ1XSV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:18:21 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:58946 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfJ1XSV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:18:21 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SNELWV177951;
        Mon, 28 Oct 2019 23:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9d3JR5jpAcTUbBrCVGrVI6UPR6/10AURvRYnUEBmtvA=;
 b=X3uqHRazdNah/AnrMsqezGnZumRr+M71vsbBDaBoxFZH7h9WmfdagifSETMC+RLCDPHA
 T2rtMFlWt3gk93DLLmPD4cmYrHf5OL+1YGYpjX6OJ/g6c3vkvaHtr2Cfu0yM9NNyPujE
 gfbyzKRVh6P9Xoj7DF/KEBlv5n+XDNTiArQ49Q4v3V0turbnbAg6akRavH0r55OMp9i7
 C6we+D2Pnhm1wX+feYyzBzWY1Sn/nt8iq3JoU9udTa5is/IfFO3w8goV1qFJES7gdOt+
 NhFIJxUSkPlJnswS21kzVrP9rUzQqU9p1vJ1iz/VA7wUMewIFqCw9UtauLv/EJHS5fyJ VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2vve3q53s3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Oct 2019 23:18:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9SNHcHV109864;
        Mon, 28 Oct 2019 23:18:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2vvyksswsf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Oct 2019 23:18:10 +0000
Received: from abhmp0023.oracle.com (abhmp0023.oracle.com [141.146.116.29])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9SNI7Nl004624;
        Mon, 28 Oct 2019 23:18:08 GMT
Received: from localhost (/10.159.156.71)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 28 Oct 2019 23:18:07 +0000
Date:   Mon, 28 Oct 2019 16:18:06 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <20191028231806.GA15222@magnolia>
References: <20191029101151.54807d2f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029101151.54807d2f@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910280219
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9424 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910280218
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 10:11:51AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

<groan> Yeah, that's the same thing reported by the kbuild robot an hour
ago.  FWIW I pushed a fixed branch but I guess it's too late for today,
oh well....

...the root cause of course was the stray '}' in one of the commits,
that I didn't catch because compat ioctls are hard. :(

Sorry about the mess.

--D

> fs/compat_ioctl.c: In function '__do_compat_sys_ioctl':
> fs/compat_ioctl.c:1056:2: error: case label not within a switch statement
>  1056 |  case FICLONE:
>       |  ^~~~
> fs/compat_ioctl.c:1057:2: error: case label not within a switch statement
>  1057 |  case FICLONERANGE:
>       |  ^~~~
> fs/compat_ioctl.c:1058:2: error: case label not within a switch statement
>  1058 |  case FIDEDUPERANGE:
>       |  ^~~~
> fs/compat_ioctl.c:1059:2: error: case label not within a switch statement
>  1059 |  case FS_IOC_FIEMAP:
>       |  ^~~~
> fs/compat_ioctl.c:1062:2: error: case label not within a switch statement
>  1062 |  case FIBMAP:
>       |  ^~~~
> fs/compat_ioctl.c:1063:2: error: case label not within a switch statement
>  1063 |  case FIGETBSZ:
>       |  ^~~~
> fs/compat_ioctl.c:1064:2: error: case label not within a switch statement
>  1064 |  case FIONREAD:
>       |  ^~~~
> fs/compat_ioctl.c:1066:4: error: break statement not within loop or switch
>  1066 |    break;
>       |    ^~~~~
> fs/compat_ioctl.c:1069:2: error: 'default' label not within a switch statement
>  1069 |  default:
>       |  ^~~~~~~
> fs/compat_ioctl.c:1078:3: error: break statement not within loop or switch
>  1078 |   break;
>       |   ^~~~~
> fs/compat_ioctl.c:1077:4: error: label 'do_ioctl' used but not defined
>  1077 |    goto do_ioctl;
>       |    ^~~~
> fs/compat_ioctl.c:1073:5: error: label 'out_fput' used but not defined
>  1073 |     goto out_fput;
>       |     ^~~~
> fs/compat_ioctl.c:1005:3: error: label 'out' used but not defined
>  1005 |   goto out;
>       |   ^~~~
> fs/compat_ioctl.c:1079:2: warning: no return statement in function returning non-void [-Wreturn-type]
>  1079 |  }
>       |  ^
> fs/compat_ioctl.c: At top level:
> fs/compat_ioctl.c:1081:2: error: expected identifier or '(' before 'if'
>  1081 |  if (compat_ioctl_check_table(XFORM(cmd)))
>       |  ^~
> fs/compat_ioctl.c:1084:2: warning: data definition has no type or storage class
>  1084 |  error = do_ioctl_trans(cmd, arg, f.file);
>       |  ^~~~~
> fs/compat_ioctl.c:1084:2: error: type defaults to 'int' in declaration of 'error' [-Werror=implicit-int]
> fs/compat_ioctl.c:1084:25: error: 'cmd' undeclared here (not in a function)
>  1084 |  error = do_ioctl_trans(cmd, arg, f.file);
>       |                         ^~~
> fs/compat_ioctl.c:1084:30: error: 'arg' undeclared here (not in a function)
>  1084 |  error = do_ioctl_trans(cmd, arg, f.file);
>       |                              ^~~
> fs/compat_ioctl.c:1084:35: error: 'f' undeclared here (not in a function); did you mean 'fd'?
>  1084 |  error = do_ioctl_trans(cmd, arg, f.file);
>       |                                   ^
>       |                                   fd
> fs/compat_ioctl.c:1085:2: error: expected identifier or '(' before 'if'
>  1085 |  if (error == -ENOIOCTLCMD)
>       |  ^~
> fs/compat_ioctl.c:1088:2: error: expected identifier or '(' before 'goto'
>  1088 |  goto out_fput;
>       |  ^~~~
> fs/compat_ioctl.c:1090:15: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>  1090 |  found_handler:
>       |               ^
> fs/compat_ioctl.c:1092:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>  1092 |  do_ioctl:
>       |          ^
> fs/compat_ioctl.c:1094:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>  1094 |  out_fput:
>       |          ^
> fs/compat_ioctl.c:1096:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>  1096 |  out:
>       |     ^
> fs/compat_ioctl.c:1098:1: error: expected identifier or '(' before '}' token
>  1098 | }
>       | ^
> fs/compat_ioctl.c:976:12: warning: 'compat_ioctl_check_table' defined but not used [-Wunused-function]
>   976 | static int compat_ioctl_check_table(unsigned int xcmd)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   d5e20bfa0b77 ("fs: add generic UNRESVSP and ZERO_RANGE ioctl handlers")
> 
> I have used the xfs tree from next-20191028 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


